import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/feature/auth/data/models/login_model.dart';
import 'package:chef_app/feature/auth/data/repository/auth_repository.dart';
import 'package:chef_app/feature/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(LoginInitial());
  final AuthRepository authRepo;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoginPasswordVisible = true;
  IconData passwordIcon = Icons.visibility;

  void changePasswordIconSignIn() {
    isLoginPasswordVisible = !isLoginPasswordVisible;
    emit(LoginPasswordVisibilityStateLoading());
    passwordIcon =
        isLoginPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(LoginPasswordVisibilityStateSuccess());
  }

  //! loginMethod
  LoginModel? loginModel;
  loginMethod() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) {
        loginModel = r;
        sl<CacheHelper>().saveData(key: APIKeys.token, value: r.token);
        emit(LoginSuccessState());
      },
    );
  }
}
