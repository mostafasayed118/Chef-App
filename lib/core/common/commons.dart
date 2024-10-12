import 'package:flutter/material.dart';

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
