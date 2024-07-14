import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColor.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColor.white,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),

    // text field
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        // borderSide: const BorderSide(
        //   color: AppColor.grey,
        // ),
      ),

      //enabled Border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        // borderSide: const BorderSide(
        //   color: AppColor.grey,
        // ),
      ),

      //focused Border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        // borderSide: const BorderSide(
        //   color: AppColor.grey,
        // ),
      ),

      //error Border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        // borderSide: const BorderSide(
        //  color: AppColor.grey,
        // ),
      ),

      //hint text
      hintStyle: boldStyle(color: AppColor.grey, fontSize: 16),

      // filled: true,
      // fillColor: AppColor.backGroundTextField,
    ),

    // text button Style ..
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          AppColor.grey,
        ),
        textStyle: WidgetStateProperty.all(
          boldStyle(color: AppColor.grey, fontSize: 16),
        ),
      ),
    ),
  );
}
