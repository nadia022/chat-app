import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/register_cubit/register_cubit.dart';
import 'package:chat_app/ui/helper/dialog.dart';
import 'package:chat_app/ui/screens/chat/chat_screen.dart';
import 'package:chat_app/ui/screens/custom/custom_filled_button.dart';
import 'package:chat_app/ui/screens/custom/custom_text_form_field.dart';
import 'package:chat_app/ui/screens/login/login_screen.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/utils/app_colors.dart';
import 'package:chat_app/ui/utils/app_styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            DialogHelper.hideLoading(context);
            DialogHelper.showMessage(
                context: context,
                message: "Registered Successfully",
                posName: "ok",
                posAction: () {
                  chatCubit.getMessages();
                  Navigator.pushNamed(context, ChatScreen.routeName,
                      arguments: emailController.text);
                });
          } else if (state is RegisterFail) {
            DialogHelper.hideLoading(context);
            DialogHelper.showMessage(
                context: context, message: state.errorMessage, posName: "ok");
          } else if (state is RegisterLoading) {
            DialogHelper.showLoading(context);
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
                    "Register",
                    style: AppStyles.supHeading22White,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!EmailValidator.validate(value)) {
                        return "Please enter a valid email";
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
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.04),
                  CustomFilledButton(
                    text: "Register",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context).register(
                            emailController.text, passwordController.text);
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: AppStyles.label16White,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginScreen.routeName,
                          );
                        },
                        child: Text(
                          "Login",
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
