import 'package:flutter/material.dart';

class WidgetTool {

  // show snackbar
  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
    ));
  }

  // show dialog
  static void showAlertDialog(BuildContext context, String title, String message, List<Widget> actions) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: actions,
    );
      },
    );
  }

  // show notif dialog

  static void showNotifDialog(BuildContext context, String title,
      String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),],
        );
      },
    );
  }
}