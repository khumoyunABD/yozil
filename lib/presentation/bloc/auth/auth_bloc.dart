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
                // User is authenticated
                emit(AuthState.authenticated(user));
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
      final result = await _loginUsecase(event.identifier, event.password);

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (user) {
          emit(AuthState.authenticated(user));
        },
      );
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _register(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      // Determine if the identifier is an email or phone number
      String? email;
      String? phoneNumber;

      if (_isEmailAddress(event.identifier)) {
        email = event.identifier;
      } else {
        phoneNumber = event.identifier;
      }

      final result = await _registerUsecase(
        email,
        event.name,
        event.password,
        phoneNumber,
      );

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (user) {
          emit(AuthState.authenticated(user));
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

  // Helper method to determine if string is an email address
  bool _isEmailAddress(String value) {
    // Simple email validation regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }
}
