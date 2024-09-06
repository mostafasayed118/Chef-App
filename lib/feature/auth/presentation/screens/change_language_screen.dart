import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/cubit/global_cubit.dart';
import '../../../../core/bloc/cubit/global_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_image.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});
//translation
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //! Background Image
            const CustomImage(
              imagePath: AppAssets.backgroundOneImage,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! Logo Image
                CustomImage(
                  imagePath: AppAssets.logoImage,
                  height: 120.h,
                  width: 120.w,
                ),
                SizedBox(height: 16.h),
                //! App Name
                Text(
                  AppStrings.onboardingTitle.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 55.h),
                Text(
                  AppStrings.onboardingSubTitle.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.white, fontSize: 24.sp),
                ),
                SizedBox(height: 100.h),
                //! Buttons
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //! English Button
                        CustomButton(
                          width: 150.w,
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context)
                                .changeLanguage('en');
                          },
                          text: AppStrings.englishButton,
                          backgroundColor: AppColors.blackBottom,
                        ),
                        SizedBox(width: 35.w),
                        //! Arabic Button
                        CustomButton(
                          width: 150.w,
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context)
                                .changeLanguage('ar');
                          },
                          text: AppStrings.arabicButton,
                          backgroundColor: AppColors.blackBottom,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
