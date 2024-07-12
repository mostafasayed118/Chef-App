import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(color: AppColors.black, fontSize: 32),
      displayMedium: semiBold(color: AppColors.black, fontSize: 24),
      displaySmall: regularStyle(color: AppColors.black, fontSize: 16),
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //fouced border
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //hint
        hintStyle: regularStyle(color: AppColors.greyTextFiled, fontSize: 16)),
    //fill color
    // fillColor: AppColors.lightBlack,
    // filled: true,
  );
}

// ThemeData getAppTheme() {
//   return ThemeData(
//     primaryColor: AppColors.primary,
//     //scaffoldBackgroundColor
//     scaffoldBackgroundColor: AppColors.white,
//     //appBar theme
//     appBarTheme: const AppBarTheme(
//       backgroundColor: AppColors.white,
//       centerTitle: true,
//     ),
//     //text theme
//     textTheme: TextTheme(
//       displayLarge: GoogleFonts.lato(
//         color: AppColors.background,
//         fontWeight: FontWeight.bold,
//         fontSize: 32,
//       ),
//       displayMedium: GoogleFonts.lato(
//         color: AppColors.background,
//         fontSize: 16,
//       ),
//       displaySmall: GoogleFonts.lato(
//         color: AppColors.background.withOpacity(0.44),
//         fontSize: 16,
//       ),
//     ),
//     //button theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.primary,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4)))),
//   );
// }
