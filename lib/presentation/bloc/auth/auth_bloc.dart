import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yozil/data/data.dart';
import 'package:yozil/domain/domain.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final LogoutUsecase _logoutUsecase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final IsLoggedInUsecase _isLoggedInUsecase;

  AuthBloc({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required LogoutUsecase logoutUsecase,
    required GetCurrentUserUsecase getCurrentUserUsecase,
    required IsLoggedInUsecase isLoggedInUsecase,
  })  : _loginUsecase = loginUsecase,
        _registerUsecase = registerUsecase,
        _logoutUsecase = logoutUsecase,
        _getCurrentUserUsecase = getCurrentUserUsecase,
        _isLoggedInUsecase = isLoggedInUsecase,
        super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        checkStatus: (_) => _checkAuthStatus(emit),
        login: (e) => _login(e, emit),
        register: (e) => _register(e, emit),
        logout: (_) => _logout(emit),
      );
    });
  }

  Future<void> _checkAuthStatus(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final isLoggedInResult = await _isLoggedInUsecase();

      await isLoggedInResult.fold(
        (failure) {
          // Handle failure from isLoggedIn check
          emit(AuthState.error(failure.message));
        },
        (isLoggedIn) async {
          if (isLoggedIn) {
            final userResult = await _getCurrentUserUsecase();
            userResult.fold(
              (failure) {
                // Handle failure from getCurrentUser
                emit(AuthState.error(failure.message));
              },
              (user) {
                if (user != null) {
                  // User is authenticated
                  emit(AuthState.authenticated(user));
                } else {
                  // No user found despite isLoggedIn being true
                  emit(const AuthState.unauthenticated());
                }
              },
            );
          } else {
            // User is not logged in
            emit(const AuthState.unauthenticated());
          }
        },
      );
    } catch (e) {
      // Catch any unexpected errors
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final result = await _loginUsecase(event.email, event.password);

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (user) {
          if (user != null) {
            emit(AuthState.authenticated(user));
          } else {
            emit(const AuthState.error("Login failed: User data is null"));
          }
        },
      );
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _register(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final result = await _registerUsecase(
        event.email,
        event.password,
        event.name,
      );

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (user) {
          if (user != null) {
            emit(AuthState.authenticated(user));
          } else {
            emit(const AuthState.error(
                "Registration failed: User data is null"));
          }
        },
      );
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _logout(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final result = await _logoutUsecase();

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (_) => emit(const AuthState.unauthenticated()),
      );
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
