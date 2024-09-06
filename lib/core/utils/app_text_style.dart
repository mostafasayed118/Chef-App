import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _textStyle(
    {required Color color,
    required double fontSize,
    required FontWeight fontWeight}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}
//! Bold style
TextStyle boldStyle({
  required Color color,
  required double fontSize,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

//! Semi Bold style

TextStyle semiBold({
  required Color color,
  required double fontSize,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );

//! Regular style

TextStyle regularStyle({
  required Color color,
  required double fontSize,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
