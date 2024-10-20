import 'package:chef_app/core/common/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/core/widgets/custom_textField_button.dart';
import 'package:chef_app/feature/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:chef_app/feature/auth/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          AppStrings.createNewPassword.tr(context),
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 18.sp,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                showToast(
                    message: AppStrings.resetPasswordSuccess.tr(context),
                    state: ToastStates.success);
                navigatePushNamed(
                    context: context, routeName: Routes.signin);
              }
              if (state is ResetPasswordError) {
                showToast(message: state.message, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgotPasswordCubit>(context)
                    .resetPasswordKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! Image Section
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 26),
                        child: CustomImage(
                          imagePath: AppAssets.lockImage,
                          height: 250.h,
                          width: 250.w,
                        ),
                      ),

                      //! Text Section
                      Text(
                        AppStrings.createNewPassword.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 18.sp, color: AppColors.black),
                        textAlign: TextAlign.center,
                      ),

                      //? TextField Section
                      //! New Password TextField
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CustomTextFormField(
                          isPassword:
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .isResetNewPasswordVisible,
                          icon: BlocProvider.of<ForgotPasswordCubit>(context)
                              .suffixIconNewPassword,
                          onPressedIcon: () {
                            BlocProvider.of<ForgotPasswordCubit>(context)
                                .changeNewPasswordIconResetPassword();
                          },
                          labelText: AppStrings.newPasswordHint.tr(context),
                          hintText: AppStrings.newPasswordHint.tr(context),
                          controller:
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .newPasswordController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return AppStrings.passwordError.tr(context);
                            }
                            return null;
                          },
                        ),
                      ),

                      //! Confirm Password TextField
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CustomTextFormField(
                          isPassword:
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .isResetConfirmPasswordVisible,
                          icon: BlocProvider.of<ForgotPasswordCubit>(context)
                              .suffixIconConfirmPassword,
                          onPressedIcon: () {
                            BlocProvider.of<ForgotPasswordCubit>(context)
                                .changeConfirmPasswordIconResetPassword();
                          },
                          labelText: AppStrings.confirmPasswordHint.tr(context),
                          hintText: AppStrings.confirmPasswordHint.tr(context),
                          controller:
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return AppStrings.passwordError.tr(context);
                            }
                            if (value !=
                                BlocProvider.of<ForgotPasswordCubit>(context)
                                    .newPasswordController
                                    .text) {
                              return AppStrings.confirmPasswordError
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                      ),
                      //! Code TextField
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CustomTextFormField(
                          keyboardType: TextInputType.number,
                          labelText: AppStrings.codeHint.tr(context),
                          hintText: AppStrings.codeHint.tr(context),
                          controller:
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .codeController,
                          validator: (value) {
                            if (value!.isEmpty || value.length != 6) {
                              return AppStrings.codeError.tr(context);
                            }
                            if (num.tryParse(value) == null) {
                              return AppStrings.codeError.tr(context);
                            }
                            return null;
                          },
                        ),
                      ),
                      //! Button Section
                      state is ResetPasswordLoading
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                              text: AppStrings.resetPasswordButton.tr(context),
                              onPressed: () {
                                if (BlocProvider.of<ForgotPasswordCubit>(context)
                                    .resetPasswordKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<ForgotPasswordCubit>(context)
                                      .resetPassword();
                                }
                              },
                            ),
                    ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
