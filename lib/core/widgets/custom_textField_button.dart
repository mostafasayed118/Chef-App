import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedIcon;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
    this.validator,
    this.icon,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onFieldSubmitted,
    this.onPressedIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onTap: onPressed,
      cursorColor: Theme.of(context).primaryColor,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      style: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(color: AppColors.black, fontSize: 16.sp),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressedIcon,
          icon: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
