import 'package:chef_app/feature/auth/data/repository/auth_repository.dart';
import 'package:chef_app/feature/auth/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepository) : super(ForgotPasswordInitial());
  final AuthRepository authRepository;
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController codeController = TextEditingController();



  void sendCode() async {
    emit(ForgotPasswordLoading());
    final result = await authRepository.sendCode(
      emailController.text,
    );
    result.fold(
      (l) {
        emit(ForgotPasswordError(l));
      },
      (r) {
        emit(ForgotPasswordSuccess(r));
      },
    );
  }
  //! change new password visibility
  bool isResetNewPasswordVisible = true;
  IconData suffixIconNewPassword = Icons.visibility;

  void changeNewPasswordIconResetPassword() {
    isResetNewPasswordVisible = !isResetNewPasswordVisible;
    suffixIconNewPassword =
        isResetNewPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeResetNewPasswordVisibilityStateSuccess());
  }

  //! change confirm password visibility
  bool isResetConfirmPasswordVisible = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordIconResetPassword() {
    isResetConfirmPasswordVisible = !isResetConfirmPasswordVisible;
    suffixIconConfirmPassword =
        isResetConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeResetConfirmPasswordVisibilityStateSuccess());
  }

  void resetPassword() async {
    emit(ResetPasswordLoading());
    final result = await authRepository.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    result.fold(
      (l) {
        emit(ResetPasswordError(l));
      },
      (r) {
        emit(ResetPasswordSuccess(r));
      },
    );
  }
}
