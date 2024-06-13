import 'package:flutter/material.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';
import 'package:hafiz_app/core/styles/color/app_text_style.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColor.darkGreen,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: AppTextStyle.textBold,
      bodyMedium: AppTextStyle.text14Black,
      labelLarge: AppTextStyle.textAmiri20,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyle.textBold,
      bodyMedium: AppTextStyle.text14Black,
      labelLarge: AppTextStyle.textAmiri20.copyWith(
        color: AppColor.lightGreen,
      ),
    ),
  );
}
