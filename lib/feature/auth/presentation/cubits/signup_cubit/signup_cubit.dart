import 'package:chef_app/feature/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit() : super(SignupInitial());


  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController minChargeController = TextEditingController();
  final TextEditingController discretionController = TextEditingController();
  final TextEditingController heathCertificateController =
      TextEditingController();
  final TextEditingController frontIdController = TextEditingController();
  final TextEditingController backIdController = TextEditingController();
  final TextEditingController profileIdController = TextEditingController();

  bool isPasswordLoading = true;
  IconData passwordIcon = Icons.visibility;

  void changePasswordIconSignUp() {
    isPasswordLoading = !isPasswordLoading;
    emit(SignUpPasswordVisibilityStateLoading());
    passwordIcon = isPasswordLoading ? Icons.visibility : Icons.visibility_off;
    emit(SignUpPasswordVisibilityStateSuccess());
  }
}
