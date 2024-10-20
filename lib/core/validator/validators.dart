import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class Validators {
  static String? validateEmail(String? value, BuildContext context) {
    if (value!.isEmpty || !value.contains("@")) {
      return AppStrings.emailError.tr(context);
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value!.isEmpty || value.length < 6) {
      return AppStrings.passwordError.tr(context);
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter city';
    }
    return null;
  }
}
