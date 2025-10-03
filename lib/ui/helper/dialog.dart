import 'package:flutter/material.dart';

class DialogHelper {
  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text("Loading...")
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String? posName,
      String? negName,
      Function? posAction,
      Function? negAction}) {
    List<Widget> actions = [];
    if (posName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posName,
            style: const TextStyle(fontSize: 22),
          )));
    }
    if (negName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negName)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(message), actions: actions);
        });
  }
}
