import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/ui/screens/custom/chat_bubble.dart';
import 'package:chat_app/ui/screens/custom/chat_bubble_for_another_person.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "chatScreen";
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var chatCubit = BlocProvider.of<ChatCubit>(context);
    TextEditingController messageController = TextEditingController();
    String email = ModalRoute.of(context)!.settings.arguments as String;

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
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is chatSuccess) {
                  messages = state.messages;
                }
              },
              builder: (context, state) {
                if (state is chatSuccess) {
                  return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return messages[index].email == email
                            ? ChatBubble(
                                message: messages[index].message,
                              )
                            : ChatBuubleForAnotherPerdon(
                                message: messages[index].message);
                      });
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.015, horizontal: width * 0.04),
            child: TextField(
              onSubmitted: (value) {
                chatCubit.sendMessage(messageController.text, email);
                chatCubit.getMessages();
                messageController.clear();
              },
              controller: messageController,
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
