import 'package:dartz/dartz.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/data/data.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String identifier, String password);
  Future<Either<Failure, User>> register(
      String? email, String name, String password, String? phoneNumber,
      {String userType = 'customer'});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, bool>> isLoggedIn();
}
