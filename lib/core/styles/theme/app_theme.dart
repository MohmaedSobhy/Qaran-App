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
      actionsIconTheme: IconThemeData(
        color: AppColor.darkGreen,
        size: 28,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.darkGreen,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: AppTextStyle.textBold,
      displayMedium: AppTextStyle.textPoppins20,
      bodyMedium: AppTextStyle.text18Black,
      labelLarge: AppTextStyle.textAmiri20,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: AppColor.white,
        size: 28,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyle.textBold,
      displayMedium: AppTextStyle.textPoppins20.copyWith(
        color: Colors.white,
      ),
      bodyMedium: AppTextStyle.text18Black.copyWith(
        color: Colors.white,
      ),
      labelLarge: AppTextStyle.textAmiri20.copyWith(
        color: AppColor.white,
      ),
    ),
  );
}
