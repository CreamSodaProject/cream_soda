import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class UseOutlinedButton extends StatelessWidget {
  String title;
  double? width;
  Color? color;
  VoidCallback onPressed;

  UseOutlinedButton({required this.title, required this.onPressed, this.width, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color ?? lightColorScheme.primary),
        ),
        child: Text(title),
      ),
    );
  }
}
