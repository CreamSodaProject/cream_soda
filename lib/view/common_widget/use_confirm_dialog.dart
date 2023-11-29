import 'package:flutter/material.dart';

class UseConfirmDialog extends StatelessWidget {
  String title;
  String content;
  VoidCallback onPressed;

  UseConfirmDialog({required this.title, required this.content, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(title),
      content:  Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: const Text('확인'),
        ),
      ],
    );
  }
}
