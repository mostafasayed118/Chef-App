import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/feature/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  //! Cubits
  sl.registerLazySingleton(() => GlobalCubit());
  //! loginCubit
  sl.registerLazySingleton(() => SignInCubit());
  //! SignUpCubit
  sl.registerLazySingleton(() => SignUpCubit());
  //! Database Caches
  sl.registerLazySingleton(() => CacheHelper());
}
