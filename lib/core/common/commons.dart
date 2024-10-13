import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

//! navigate PushNamed
void navigatePushNamed(
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  Navigator.of(context).pushNamed(routeName, arguments: arguments);
}

//! navigate PushNamedAndRemoveUntil
void navigatePushNamedAndRemoveUntil(
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
      routeName, (Route<dynamic> route) => false,
      arguments: arguments);
}

//! navigate Push
void navigatePush({required BuildContext context, required Widget widget}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

//! navigate Pop
void navigatePop({required BuildContext context}) {
  Navigator.of(context).pop();
}

//! navigate PopUntil
void navigatePopUntil({required BuildContext context}) {
  Navigator.of(context).popUntil((route) => false);
}

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { error, success, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warning:
      return AppColors.orange;
  }
}
