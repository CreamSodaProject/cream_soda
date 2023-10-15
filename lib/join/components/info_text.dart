import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class InfoText extends StatefulWidget {
  String title;
  Color color;

  InfoText({required this.title, required this.color, super.key});

  @override
  State<InfoText> createState() => _InfoTextState();
}

class _InfoTextState extends State<InfoText> {
  @override
  Widget build(BuildContext context) {

    return Row(children: [
      Icon(Icons.check_circle_outline,
          color: widget.color, size: font12),
      const SizedBox(width: gap5),
      Text(widget.title,
          style: TextStyle(color: widget.color, fontSize: font12))
    ]);
  }
}
