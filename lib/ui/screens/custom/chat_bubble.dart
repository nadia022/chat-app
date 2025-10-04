import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: width * 0.8,
        ),
        padding: EdgeInsets.symmetric(
            vertical: height * 0.032, horizontal: width * 0.04),
        margin: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.04),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: AppColors.primaryColor),
        child: Text(
          "Hello im a new user what about you",
          style: AppStyles.label16White,
        ),
      ),
    );
  }
}
