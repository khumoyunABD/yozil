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

    final isLoggedInResult = await _isLoggedInUsecase();

    isLoggedInResult.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (isLoggedIn) async {
        if (isLoggedIn) {
          final userResult = await _getCurrentUserUsecase();
          userResult.fold(
            (failure) => emit(AuthState.error(failure.message)),
            (user) => emit(AuthState.authenticated(user)),
          );
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _loginUsecase(event.email, event.password);

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _register(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _registerUsecase(
      event.email,
      event.password,
      event.name,
    );

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _logout(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _logoutUsecase();

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
