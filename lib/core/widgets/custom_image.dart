import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const CustomImage(
      {super.key,
      required this.imagePath,
      this.height,
      this.width,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit ?? BoxFit.fill,
      height: height?.h ?? 50.h,
      width: width?.w ?? 50.w,
    );
  }
}
