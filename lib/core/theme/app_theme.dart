import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppFontSize {
  static const double extraSmall = 13;
  static const double small = 14;
  static const double medium = 16;
  static const double standard = 18;
  static const double large = 24;
  static const double extraLarge = 32;
  static const double extraExtraLarge = 36;
}

class AppBorderRadius {
  static const double small = 8;
  static const double standard = 10;
  static const double large = 20;
  static const double extraLarge = 30;
  static const double extraExtraLarge = 40;
}

ThemeData getAppLightTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      //! scaffoldBackgroundColor
      scaffoldBackgroundColor: AppColors.white,
      //! appBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      //! text theme
      textTheme: TextTheme(
        displayLarge:
            boldStyle(color: AppColors.white, fontSize: AppFontSize.extraLarge),
        displayMedium:
            semiBold(color: AppColors.black, fontSize: AppFontSize.large),
        displaySmall:
            regularStyle(color: AppColors.black, fontSize: AppFontSize.medium),
      ),
      //! button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.small),
          ),
        ),
      ),
      //! Text form field theme
      inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.small)),
        //focused border
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.small)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.small)),
        errorStyle: regularStyle(
            color: AppColors.red, fontSize: AppFontSize.extraSmall),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(AppBorderRadius.small),
        ),
        //hint
        hintStyle: regularStyle(
            color: AppColors.greyTextFiled, fontSize: AppFontSize.medium),
        labelStyle: regularStyle(
            color: AppColors.blackBottom, fontSize: AppFontSize.medium),
      ),

      //fill color
      // fillColor: AppColors.lightBlack,
      // filled: true,

      //! TextButton theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: regularStyle(
              color: AppColors.blackBottom, fontSize: AppFontSize.large),
        ),
      ),
      tabBarTheme: const TabBarTheme());
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
