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
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/api/auth/login/',
        data: {
          'email': email,
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
        email: response.data['email'],
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
  Future<User> register(String email, String password, String name,
      {String userType = 'customer'}) async {
    try {
      final response = await dio.post(
        '/api/auth/register/',
        data: {
          'email': email,
          'username': name,
          'password': password,
          'password2': password,
          'user_type': userType,
        },
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
        email: userData['email'],
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
        if (responseData != null &&
            responseData.containsKey('email') &&
            responseData['email'][0].contains('already exists')) {
          throw EmailAlreadyInUseException();
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

  // Clean up resources
  void dispose() {
    _authStateController.close();
  }
}
