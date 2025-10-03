import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  String? Function(String? value) validator;
  CustomTextFormField(
      {super.key, required this.hintText, required this.validator,required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      style: AppStyles.label16White,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.label16White,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.whiteColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.whiteColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
