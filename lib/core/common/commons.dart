import 'package:flutter/material.dart';

void navigatePushNamed(
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  Navigator.of(context).pushNamed(routeName, arguments: arguments);
}
