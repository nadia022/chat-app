import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  CustomFilledButton({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FilledButton(
        style: FilledButton.styleFrom(
          fixedSize: Size(width, height * 0.056),
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.supHeading22DarkBlue,
        ));
  }
}
