import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class UseElevatedButton extends StatelessWidget {
  String title;
  double? width;
  Color? bgColor;
  Color? fgColor;
  VoidCallback onPressed;

  UseElevatedButton(
      {required this.title,
      required this.onPressed,
      this.bgColor,
      this.fgColor,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? lightColorScheme.primary,
          foregroundColor: fgColor ?? lightColorScheme.onPrimary
        ),
        child: Text(title),
      ),
    );
  }
}
