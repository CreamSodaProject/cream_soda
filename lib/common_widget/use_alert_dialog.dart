import 'package:flutter/material.dart';

class UseAlertDialog extends StatelessWidget {
  String title;
  String content;
  VoidCallback confirmFunction;
  VoidCallback cancelFunction;

  UseAlertDialog(
      {required this.title,
      required this.content,
      required this.confirmFunction,
      required this.cancelFunction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(title),
      content:  Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: cancelFunction,
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: confirmFunction,
          child: const Text('확인'),
        ),
      ],
    );
  }
}
