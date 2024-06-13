import 'package:flutter/material.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';

abstract class AppTextStyle {
  static const TextStyle textPoppins20 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: "Poppins",
    fontSize: 20,
  );
  static const TextStyle textBold = TextStyle(
    color: AppColor.lightGreen,
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  static const TextStyle text18Black = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const TextStyle textAmiri20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.lightGreen,
    fontFamily: "Amiri",
  );
}
