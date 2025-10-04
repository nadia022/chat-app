import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle heading32White = const TextStyle(
    fontSize: 32,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle supHeading22White = const TextStyle(
    fontSize: 22,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle title22BoldWhite = const TextStyle(
      fontSize: 22, color: AppColors.whiteColor, fontWeight: FontWeight.bold);
  static TextStyle supHeading22DarkBlue = const TextStyle(
    fontSize: 22,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle label16White = const TextStyle(
    fontSize: 16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );
}
