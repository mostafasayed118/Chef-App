import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  const CustomTextButton(
      {super.key, this.onPressed, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Theme.of(context).textButtonTheme.style,
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.greyForget, fontSize: 16.sp),
      ),
    );
  }
}
