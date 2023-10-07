import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class UsePageTitleText extends StatefulWidget {
  String title;
  UsePageTitleText({required this.title, super.key});

  @override
  State<UsePageTitleText> createState() => _UsePageTitleState();
}

class _UsePageTitleState extends State<UsePageTitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title, style: const TextStyle(
        fontSize: pageTitleFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black)
    );
  }
}
