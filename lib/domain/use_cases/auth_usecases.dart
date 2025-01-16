// lib/domain/usecases/auth/login_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/data/data.dart';
import 'package:yozil/domain/domain.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) {
    return repository.login(email, password);
  }
}

// lib/domain/usecases/auth/register_usecase.dart
class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, User>> call(
      String email, String password, String name) {
    return repository.register(email, password, name);
  }
}

// lib/domain/usecases/auth/logout_usecase.dart
class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.logout();
  }
}

// lib/domain/usecases/auth/get_current_user_usecase.dart
class GetCurrentUserUsecase {
  final AuthRepository repository;

  GetCurrentUserUsecase(this.repository);

  Future<Either<Failure, User>> call() {
    return repository.getCurrentUser();
  }
}

// lib/domain/usecases/auth/is_logged_in_usecase.dart
class IsLoggedInUsecase {
  final AuthRepository repository;

  IsLoggedInUsecase(this.repository);

  Future<Either<Failure, bool>> call() {
    return repository.isLoggedIn();
  }
}
