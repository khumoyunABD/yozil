import 'package:dartz/dartz.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/data/data.dart';
import 'package:yozil/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource remoteSource;

  AuthRepositoryImpl(this.remoteSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final user = await remoteSource.login(email, password);
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
    String email,
    String password,
    String name,
  ) async {
    try {
      final user = await remoteSource.register(email, password, name);
      return Right(user);
    } on EmailAlreadyInUseException {
      return Left(const Failure.emailAlreadyInUse());
    } on ServerException {
      return Left(const Failure.server());
    } catch (e) {
      return Left(const Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(const Failure.server());
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      }
      return Left(const Failure.unauthenticated());
    } catch (e) {
      return Left(const Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final user = await remoteSource.getCurrentUser();
      return Right(user != null);
    } catch (e) {
      return Left(const Failure.unexpected());
    }
  }
}
