import 'package:cream_soda/view/common_widget/use_text_button.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  String infoText;
  String buttonTitle;
  VoidCallback onPressed;

  InfoButton({required this.infoText, required this.buttonTitle, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(infoText),
          const SizedBox(width: gap10),
          UseTextButton(title: buttonTitle, onPressed: onPressed),
        ]
    );
  }
}
