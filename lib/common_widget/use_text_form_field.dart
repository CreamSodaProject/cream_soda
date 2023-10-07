import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class UseTextFormField extends StatefulWidget {
  TextEditingController controller;
  int? maxLines;
  TextInputType? keyboardType;
  String hintText;
  bool? obscureTextCheck;
  String? Function(String?)? validator;

  UseTextFormField({
    required this.controller,
    this.maxLines,
    this.keyboardType,
    required this.hintText,
    this.validator,
    this.obscureTextCheck,
    Key? key,
  }) : super(key: key);

  @override
  State<UseTextFormField> createState() => _UseTextFormFieldState();
}

class _UseTextFormFieldState extends State<UseTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: gap10),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        cursorColor: lightColorScheme.primary,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.obscureTextCheck ?? false,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: lightColorScheme.outline),
          focusColor: lightColorScheme.primary,
        ),
      ),
    );
  }
}
