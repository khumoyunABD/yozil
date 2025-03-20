import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/data/data.dart';

class DjangoAuthRemoteSourceImpl implements AuthRemoteSource {
  DjangoAuthRemoteSourceImpl({
    required this.dio,
    required this.sharedPreferences,
  });

  final Dio dio;
  final SharedPreferences sharedPreferences;

  // Keys for storing tokens in shared preferences
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';

  // StreamController for authentication state changes
  final _authStateController = StreamController<User?>.broadcast();

  @override
  Stream<User?> authStateChanges() {
    return _authStateController.stream;
  }

  @override
  Future<User?> getCurrentUser() async {
    final token = sharedPreferences.getString(_accessTokenKey);
    if (token == null) {
      _authStateController.add(null);
      return null;
    }

    try {
      final response = await dio.get(
        '/api/auth/profile/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final userData = User.fromJson(response.data);
      _authStateController.add(userData);
      return userData;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Token might be expired, try to refresh
        final refreshed = await _refreshToken();
        if (refreshed) {
          return getCurrentUser();
        } else {
          _authStateController.add(null);
          return null;
        }
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<User> login(String identifier, String password) async {
    try {
      // Determine if the identifier is an email or phone number
      final bool isEmail = _isEmailAddress(identifier);

      final response = await dio.post(
        '/api/auth/login/',
        data: {
          isEmail ? 'email' : 'phone_number': identifier,
          'password': password,
        },
      );

      // Save tokens
      await sharedPreferences.setString(
          _accessTokenKey, response.data['access']);
      await sharedPreferences.setString(
          _refreshTokenKey, response.data['refresh']);

      // Create user object from response data
      final user = User(
        id: response.data['user_id'].toString(),
        email: response.data['email'] ?? '',
        phoneNumber: response.data['phone_number'] ?? '',
        name: response.data['username'],
        createdAt: DateTime.now(), // Adjust as needed
        userType: response.data['user_type'],
        isPremium: response.data['is_premium'],
      );

      // Save user data
      await sharedPreferences.setString(_userDataKey, user.toJson().toString());

      // Emit new auth state
      _authStateController.add(user);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw InvalidCredentialsException();
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<User> register(
      String? email, String name, String password, String? phoneNumber,
      {String userType = 'customer'}) async {
    // Validate that either email or phone number is provided
    if (email == null && phoneNumber == null) {
      throw ValidationException('Either email or phone number is required');
    }

    try {
      final Map<String, dynamic> registrationData = {
        'username': name,
        'password': password,
        'user_type': userType,
      };

      // Add email or phone number to the request data
      if (email != null) {
        registrationData['email'] = email;
      }

      if (phoneNumber != null) {
        registrationData['phone_number'] = phoneNumber;
      }

      final response = await dio.post(
        '/api/auth/register/',
        data: registrationData,
      );

      // Save tokens
      await sharedPreferences.setString(
          _accessTokenKey, response.data['access']);
      await sharedPreferences.setString(
          _refreshTokenKey, response.data['refresh']);

      // Extract user data
      final userData = response.data['user'];

      // Create user object
      final user = User(
        id: userData['id'].toString(),
        email: userData['email'] ?? '',
        phoneNumber: userData['phone_number'] ?? '',
        name: userData['username'],
        createdAt: DateTime.now(), // Adjust as needed
        userType: userData['user_type'],
        isPremium: userData['is_premium'],
      );

      // Save user data
      await sharedPreferences.setString(_userDataKey, user.toJson().toString());

      // Emit new auth state
      _authStateController.add(user);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final responseData = e.response?.data;
        if (responseData != null) {
          if (responseData.containsKey('email') &&
              responseData['email'][0].contains('already exists')) {
            throw EmailAlreadyInUseException();
          }
          if (responseData.containsKey('phone_number') &&
              responseData['phone_number'][0].contains('already exists')) {
            throw PhoneNumberAlreadyInUseException();
          }
        }
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      final refreshToken = sharedPreferences.getString(_refreshTokenKey);
      final accessToken = sharedPreferences.getString(_accessTokenKey);

      if (accessToken != null && refreshToken != null) {
        await dio.post(
          '/api/auth/logout/',
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            },
          ),
          data: {
            'refresh': refreshToken,
          },
        );
      }
    } catch (e) {
      // Even if server logout fails, we still want to clear local state
    } finally {
      // Clear tokens and user data
      await sharedPreferences.remove(_accessTokenKey);
      await sharedPreferences.remove(_refreshTokenKey);
      await sharedPreferences.remove(_userDataKey);

      // Emit null to indicate logged out state
      _authStateController.add(null);
    }
  }

  // Helper method to refresh token
  Future<bool> _refreshToken() async {
    final refreshToken = sharedPreferences.getString(_refreshTokenKey);
    if (refreshToken == null) return false;

    try {
      final response = await dio.post(
        '/api/auth/login/refresh/',
        data: {
          'refresh': refreshToken,
        },
      );

      await sharedPreferences.setString(
          _accessTokenKey, response.data['access']);
      return true;
    } catch (e) {
      // If refresh fails, clear tokens and return false
      await sharedPreferences.remove(_accessTokenKey);
      await sharedPreferences.remove(_refreshTokenKey);
      return false;
    }
  }

  // Helper method to determine if string is an email address
  bool _isEmailAddress(String value) {
    // Simple email validation regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  // Clean up resources
  void dispose() {
    _authStateController.close();
  }
}
