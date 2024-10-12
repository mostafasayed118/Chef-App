import 'package:chef_app/feature/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(LoginInitial());

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
}
