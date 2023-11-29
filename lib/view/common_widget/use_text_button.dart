import 'package:flutter/material.dart';

class UseTextButton extends StatefulWidget {
  String title;
  VoidCallback onPressed;

  UseTextButton({required this.title, required this.onPressed, super.key});

  @override
  State<UseTextButton> createState() => _UseTextButtonState();
}

class _UseTextButtonState extends State<UseTextButton> {
  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(widget.title),);
  }
}
