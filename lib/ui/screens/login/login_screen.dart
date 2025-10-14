import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/ui/helper/dialog.dart';
import 'package:chat_app/ui/screens/chat/chat_screen.dart';
import 'package:chat_app/ui/screens/custom/custom_filled_button.dart';
import 'package:chat_app/ui/screens/custom/custom_text_form_field.dart';
import 'package:chat_app/ui/screens/register/register_screen.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var chatCubit = BlocProvider.of<ChatCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            DialogHelper.showLoading(context);
          } else if (state is LoginSuccess) {
            DialogHelper.hideLoading(context);
            DialogHelper.showMessage(
                context: context,
                message: "Login Sucessfully",
                posName: "ok",
                posAction: () {
                  chatCubit.getMessages();
                  Navigator.pushNamed(context, ChatScreen.routeName,
                      arguments: emailController.text);
                });
          } else if (state is LoginFail) {
            DialogHelper.hideLoading(context);
            DialogHelper.showMessage(
              context: context,
              message: state.errorMessage,
              posName: "ok",
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.06),
                  Center(child: Image.asset(AppAssets.logo)),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Text(
                      "Scholar Chat",
                      style: AppStyles.heading32White,
                    ),
                  ),
                  SizedBox(height: height * 0.09),
                  Text(
                    "Sign In",
                    style: AppStyles.supHeading22White,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.026),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.04),
                  CustomFilledButton(
                    text: "Sign In",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ?",
                        style: AppStyles.label16White,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RegisterScreen.routeName,
                          );
                        },
                        child: Text(
                          "Register",
                          style: AppStyles.label16White,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
