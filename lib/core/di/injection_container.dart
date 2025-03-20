// lib/core/di/injection_container.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yozil/data/data.dart';
import 'package:yozil/domain/domain.dart';
import 'package:yozil/presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Firebase
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Set up Dio
  final dio = Dio(BaseOptions(
    baseUrl: 'http://127.0.0.1:8000', // Change to your Django API URL
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(seconds: 8),
    contentType: 'application/json',
    responseType: ResponseType.json,
  ));

  // Optional: Add a logging interceptor for debugging
  if (true) {
    // Set to a debug flag in your config
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Add a token refresh interceptor
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          // Try to refresh the token and retry the request
          final refreshToken = sharedPreferences.getString('refresh_token');
          if (refreshToken != null) {
            try {
              final response = await Dio().post(
                'http://127.0.0.1:8000/api/auth/login/refresh/',
                data: {'refresh': refreshToken},
              );

              if (response.statusCode == 200) {
                final newToken = response.data['access'];
                await sharedPreferences.setString('access_token', newToken);

                // Retry the original request with the new token
                final opts = Options(
                  method: e.requestOptions.method,
                  headers: {
                    ...e.requestOptions.headers,
                    'Authorization': 'Bearer $newToken',
                  },
                );

                final cloneReq = await dio.request(
                  e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters,
                );

                return handler.resolve(cloneReq);
              }
            } catch (_) {
              // If refresh fails, continue with the error
            }
          }
        }
        return handler.next(e);
      },
    ),
  );

  sl.registerLazySingleton(() => dio);

  // Data Sources
  // sl.registerLazySingleton<AuthRemoteSource>(
  //   () => DjangoAuthRemoteSourceImpl(
  //     sl<FirebaseAuth>(),
  //     sl<FirebaseFirestore>(),
  //   ),
  // );

  // Register Django implementation instead
  sl.registerLazySingleton<AuthRemoteSource>(
    () => DjangoAuthRemoteSourceImpl(
      dio: sl(),
      sharedPreferences: sl(),
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
