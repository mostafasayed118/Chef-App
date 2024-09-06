import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.backgroundColor,
      this.width,
      this.height});
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 325.w,
      height: height ?? 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: WidgetStateProperty.all(
                  backgroundColor ?? Theme.of(context).primaryColor),
            ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.white,
                fontSize: 24.sp,
              ),
        ),
      ),
    );
  }
}
