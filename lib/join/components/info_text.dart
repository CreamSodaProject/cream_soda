import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class InfoText extends StatefulWidget {
  String title;

  InfoText({required this.title, super.key});

  @override
  State<InfoText> createState() => _InfoTextState();
}

class _InfoTextState extends State<InfoText> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.check_circle_outline,
          color: lightColorScheme.outline, size: font12),
      const SizedBox(width: gap5),
      Text(widget.title,
          style: TextStyle(color: lightColorScheme.outline, fontSize: font12))
    ]);
  }
}
