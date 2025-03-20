import 'package:dartz/dartz.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/data/data.dart';
import 'package:yozil/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteSource);
  final AuthRemoteSource remoteSource;

  // Add this getter here
  Stream<User?> get authStateChanges => remoteSource.authStateChanges();

  @override
  Future<Either<Failure, User>> login(
      String identifier, String password) async {
    try {
      final user = await remoteSource.login(identifier, password);
      return Right(user);
    } on InvalidCredentialsException {
      return Left(const Failure.invalidCredentials());
    } on ServerException {
      return Left(const Failure.server());
    } catch (e) {
      return Left(const Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String? email, String name, String password, String? phoneNumber,
      {String userType = 'customer'}) async {
    try {
      final user = await remoteSource.register(
        email,
        name,
        password,
        phoneNumber,
        userType: userType,
      );
      return Right(user);
    } on EmailAlreadyInUseException {
      return Left(EmailAlreadyInUseFailure());
    } on PhoneNumberAlreadyInUseException {
      return Left(PhoneNumberAlreadyInUseFailure());
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on ServerException {
      return Left(ServerFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteSource.logout();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteSource.getCurrentUser();

      if (user != null) {
        return Right(user);
      } else {
        return Left(Failure.unauthenticated());
      }
    } on ServerException {
      return Left(ServerFailure('Server error occurred'));
    } on InvalidCredentialsException {
      return Left(InvalidCredentialsFailure('Invalid Credentials'));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      // First check if tokens exist in local storage
      // final hasToken = _hasValidTokens();

      // // If no tokens, user is definitely not logged in
      // if (!hasToken) {
      //   return const Right(false);
      // }

      // If we have tokens, try to get the current user to verify
      // Only do this check if we have tokens to avoid unnecessary API calls
      try {
        final user = await remoteSource.getCurrentUser();
        return Right(user != null);
      } catch (e) {
        // If API call fails, consider user not logged in
        return const Right(false);
      }
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  // Helper method to check if tokens exist in local storage
  // bool _hasValidTokens() {
  //   final accessToken = sharedPreferences.getString(_accessTokenKey);
  //   final refreshToken = sharedPreferences.getString(_refreshTokenKey);

  //   // Only return true if both tokens exist
  //   return accessToken != null &&
  //       accessToken.isNotEmpty &&
  //       refreshToken != null &&
  //       refreshToken.isNotEmpty;
  // }
}
