import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/feature/auth/data/repository/auth_repository.dart';
import 'package:chef_app/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/feature/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  //! Cubits
  sl.registerLazySingleton(() => GlobalCubit());
  //! loginCubit
  sl.registerLazySingleton(() => SignInCubit(sl()));
  //! SignUpCubit
  sl.registerLazySingleton(() => SignUpCubit());
  //! ForgotPasswordCubit
  sl.registerLazySingleton(() => ForgotPasswordCubit(sl()));
 
  //! -------------------------------------------------------------------

  //! Database Caches
  sl.registerLazySingleton(() => CacheHelper());
  //! auth Feature
  sl.registerLazySingleton(() => AuthRepository());
  //! Api Consumer
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  //! Dio
  sl.registerLazySingleton(() => Dio());
}
