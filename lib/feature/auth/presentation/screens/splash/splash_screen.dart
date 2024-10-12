import 'package:chef_app/core/common/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterDuration();
    super.initState();
  }

  void navigateAfterDuration() {
    Future.delayed(const Duration(seconds: 3), () {
      navigatePushNamed(context: context, routeName: Routes.changeLanguage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imagePath: AppAssets.logoImage,
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(height: 16.h),
            Text(AppStrings.appName.tr(context),
                style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
