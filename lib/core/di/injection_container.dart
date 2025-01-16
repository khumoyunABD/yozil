// lib/core/di/injection_container.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:yozil/data/data.dart';
import 'package:yozil/domain/domain.dart';
import 'package:yozil/presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Data Sources
  sl.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(
      sl<FirebaseAuth>(),
      sl<FirebaseFirestore>(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl<AuthRemoteSource>(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => LoginUsecase(sl()),
  );

  sl.registerLazySingleton(
    () => RegisterUsecase(sl()),
  );

  sl.registerLazySingleton(
    () => LogoutUsecase(sl()),
  );

  sl.registerLazySingleton(
    () => GetCurrentUserUsecase(sl()),
  );

  sl.registerLazySingleton(
    () => IsLoggedInUsecase(sl()),
  );

  // Blocs
  sl.registerFactory(
    () => AuthBloc(
      loginUsecase: sl(),
      registerUsecase: sl(),
      logoutUsecase: sl(),
      getCurrentUserUsecase: sl(),
      isLoggedInUsecase: sl(),
    ),
  );
}
