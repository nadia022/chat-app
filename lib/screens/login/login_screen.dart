import 'package:chat_app/utils/app_assets.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.logo),
        ],
      ),
    );
  }
}
