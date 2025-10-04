import 'package:chat_app/ui/screens/custom/chat_bubble.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "chatScreen";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo, height: height * 0.07),
            SizedBox(width: width * 0.02),
            Text("Chat ", style: AppStyles.title22BoldWhite),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ChatBubble();
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.015, horizontal: width * 0.04),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.send,
                  color: AppColors.primaryColor,
                ),
                hintText: "Send Message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
