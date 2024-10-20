import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_textField_button.dart';
import 'package:chef_app/feature/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/commons.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../cubits/signup_cubit/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

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
                          AppStrings.signUp.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16.sp,
                                color: AppColors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              BlocConsumer<SignUpCubit, SignupState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _signupFormKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //! name field
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .nameController,
                            backgroundColor: AppColors.primaryColor,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.nameHint.tr(context),
                            hintText: AppStrings.nameHint.tr(context),
                            icon: Icons.account_circle,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.nameError.tr(context);
                              }
                              if (value.startsWith(RegExp(r'_'))) {
                                return 'Enter valid name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 32.h),
                          //!phone field
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .phoneController,
                            backgroundColor: AppColors.primaryColor,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.phoneNumberHint.tr(context),
                            hintText: AppStrings.phoneNumberHint.tr(context),
                            icon: Icons.numbers,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.phoneNumberError.tr(context);
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 32.h),
                          //! email field
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
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
                              if (value!.isEmpty || !value.contains("@")) {
                                return AppStrings.emailError.tr(context);
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 32.h),
                          //! password field
                          CustomTextFormField(
                            isPassword: BlocProvider.of<SignUpCubit>(context)
                                .isPasswordLoading,
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .passwordController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.passwordHint.tr(context),
                            hintText: AppStrings.passwordHint.tr(context),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.passwordError.tr(context);
                              }
                              if (value.length < 6) {
                                return AppStrings.passwordError.tr(context);
                              }
                              return null;
                            },
                            icon: BlocProvider.of<SignUpCubit>(context)
                                .passwordIcon,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 24.h),
                          //!confirmPassword
                          CustomTextFormField(
                            isPassword: BlocProvider.of<SignUpCubit>(context)
                                .isPasswordLoading,
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .confirmPasswordController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText:
                                AppStrings.confirmPasswordHint.tr(context),
                            hintText:
                                AppStrings.confirmPasswordHint.tr(context),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.confirmPasswordError
                                    .tr(context);
                              }
                              if (value.length < 6) {
                                return AppStrings.confirmPasswordError
                                    .tr(context);
                              }
                              return null;
                            },
                            icon: BlocProvider.of<SignUpCubit>(context)
                                .passwordIcon,
                            onPressedIcon: () {
                              BlocProvider.of<SignUpCubit>(context)
                                  .changePasswordIconSignUp();
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 32.h),
                          //! location
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .locationController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.locationHint.tr(context),
                            hintText: AppStrings.locationHint.tr(context),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.locationError.tr(context);
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.location_on,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 32.h),
                          //! brandName
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .brandNameController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.brandNameHint.tr(context),
                            hintText: AppStrings.brandNameHint.tr(context),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.brandNameError.tr(context);
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.brightness_auto_outlined,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 32.h),
                          //! minCharge
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .minChargeController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.minChargeHint.tr(context),
                            hintText: AppStrings.minChargeHint.tr(context),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.minChargeError.tr(context);
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.attach_money_outlined,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 32.h),
                          //! discretion
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .discretionController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: AppStrings.descriptionHint.tr(context),
                            hintText: AppStrings.descriptionHint.tr(context),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.descriptionError.tr(context);
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.description,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 32.h),
                          //! heathCertificate
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .heathCertificateController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: 'write here label',
                            hintText: 'write here hint',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter here message';
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.health_and_safety,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 32.h),
                          //! FrontId
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .frontIdController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: 'write here label',
                            hintText: 'write here hint',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter here message';
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.perm_contact_calendar_outlined,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 32.h),
                          //! backID
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .backIdController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: 'write here label',
                            hintText: 'write here hint',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter here message';
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.assignment_ind_rounded,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 32.h),
                          //! ProfileID
                          CustomTextFormField(
                            controller: BlocProvider.of<SignUpCubit>(context)
                                .profileIdController,
                            width: 327.w,
                            height: 48.h,
                            onPressed: () {},
                            labelText: 'write here label',
                            hintText: 'write here hint',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter here message';
                              }
                              if (value.length < 6) {
                                return 'Enter here message';
                              }
                              return null;
                            },
                            icon: Icons.abc,
                            onPressedIcon: () {},
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 24.h),

                          SizedBox(height: 64.h),
                          //! login button
                          CustomButton(
                            text: AppStrings.signUpButton.tr(context),
                            onPressed: () {
                              if (_signupFormKey.currentState!.validate()) {}
                            },
                          ),
                          SizedBox(height: 72.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.haveAccount.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: AppColors.greyForget,
                                    ),
                              ),
                              CustomTextButton(
                                text: AppStrings.signInButton.tr(context),
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
                                      routeName: Routes.signin);
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
