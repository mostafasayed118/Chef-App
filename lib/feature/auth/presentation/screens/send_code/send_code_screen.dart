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

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          AppStrings.forgotPasswordTitle.tr(context),
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
              if (state is ForgotPasswordSuccess) {
                showToast(
                    message: AppStrings.checkEmail.tr(context),
                    state: ToastStates.success);
                navigatePushNamed(
                    context: context, routeName: Routes.resetPassword);
              }
              if (state is ForgotPasswordError) {
                showToast(message: state.message, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgotPasswordCubit>(context).sendCodeKey,
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
                        AppStrings.resetPasswordTitle.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 18.sp, color: AppColors.black),
                        textAlign: TextAlign.center,
                      ),

                      //! TextField Section
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: CustomTextFormField(
                          labelText: AppStrings.emailHint.tr(context),
                          hintText: AppStrings.emailHint.tr(context),
                          controller:
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .emailController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains("@")) {
                              return AppStrings.emailError.tr(context);
                            }
                            return null;
                          },
                        ),
                      ),
                      //! Button Section
                      state is ForgotPasswordLoading
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                              text: AppStrings.sendCodeButton.tr(context),
                              onPressed: () {
                                if (BlocProvider.of<ForgotPasswordCubit>(
                                        context)
                                    .sendCodeKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<ForgotPasswordCubit>(context)
                                      .sendCode();
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
