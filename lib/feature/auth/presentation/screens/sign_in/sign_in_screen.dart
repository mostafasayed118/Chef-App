import 'package:chef_app/core/common/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/validator/validators.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_textField_button.dart';
import 'package:chef_app/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/feature/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> _signinFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //! header section
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CustomImage(
                    imagePath: AppAssets.backgroundTwoImage,
                    width: double.infinity,
                    height: 200.h,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.welcomeBack.tr(context),
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          AppStrings.signIn.tr(context),
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    showToast(
                        message: AppStrings.loginSuccess.tr(context),
                        state: ToastStates.success);
                  }
                  if (state is LoginErrorState) {
                    showToast(message: state.message, state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _signinFormKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 55.h),
                          //! email field
                          CustomTextFormField(
                              controller: BlocProvider.of<SignInCubit>(context)
                                  .emailController,
                              backgroundColor: AppColors.primaryColor,
                              width: 327.w,
                              height: 48.h,
                              onPressed: () {},
                              labelText: AppStrings.emailHint.tr(context),
                              hintText: AppStrings.emailHint.tr(context),
                              icon: Icons.email,
                              onPressedIcon: () {},
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                Validators.validateEmail(value, context);
                                return null;
                              }),
                          SizedBox(height: 32.h),
                          //! password field
                          CustomTextFormField(
                            isPassword: BlocProvider.of<SignInCubit>(context)
                                .isLoginPasswordVisible,
                            controller: BlocProvider.of<SignInCubit>(context)
                                .passwordController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.passwordHint.tr(context),
                            hintText: AppStrings.passwordHint.tr(context),
                            validator: (value) {
                              Validators.validatePassword(value, context);

                              return null;
                            },
                            icon: BlocProvider.of<SignInCubit>(context)
                                .passwordIcon,
                            onPressedIcon: () {
                              BlocProvider.of<SignInCubit>(context)
                                  .changePasswordIconSignIn();
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 16.h),
                          //! forgot password
                          Row(
                            children: [
                              CustomTextButton(
                                text: AppStrings.forgotPassword.tr(context),
                                onPressed: () {
                                  navigatePushNamed(
                                      context: context,
                                      routeName: Routes.sendCode);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          //! login button
                          state is LoginLoadingState
                              ? const CustomLoadingIndicator()
                              : CustomButton(
                                  text: AppStrings.signInButton.tr(context),
                                  onPressed: () {
                                    if (_signinFormKey.currentState!
                                        .validate()) {
                                      BlocProvider.of<SignInCubit>(context)
                                          .loginMethod();
                                    }
                                  },
                                ),
                          SizedBox(height: 72.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.dontHaveAccount.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: AppColors.greyForget,
                                    ),
                              ),
                              CustomTextButton(
                                text: AppStrings.signUpButton.tr(context),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 16.sp,
                                    ),
                                onPressed: () {
                                  navigatePushNamed(
                                      context: context,
                                      routeName: Routes.signup);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
