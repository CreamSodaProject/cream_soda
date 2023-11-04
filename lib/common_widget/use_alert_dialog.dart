import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/other_color.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
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
      title: Padding(
        padding: const EdgeInsets.only(top : gap10),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: font16,
            overflow: TextOverflow.visible,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: gap5),
        child: Text(content, textAlign: TextAlign.center),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: <Widget>[
        TextButton(
          onPressed: confirmFunction,
          child: const Text('확인'),
        ),
        TextButton(
          onPressed: cancelFunction,
          child: const Text('취소', style: TextStyle(color: Colors.redAccent)),
        ),
      ],
    );
  }
}
