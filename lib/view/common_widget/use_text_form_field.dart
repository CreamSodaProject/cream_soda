import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class UseTextFormField extends StatefulWidget {
  TextEditingController controller;
  int? maxLines;
  TextInputType? keyboardType;
  String hintText;
  bool? obscureTextCheck;
  int? maxLength;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  void Function(String)? onChanged;
  Icon? suffixIcon;
  VoidCallback? suffixIconOnPressed;
  VoidCallback? onTap;

  UseTextFormField({
    required this.controller,
    this.maxLines,
    this.keyboardType,
    required this.hintText,
    this.validator,
    this.maxLength,
    this.obscureTextCheck,
    this.textInputAction,
    this.onEditingComplete,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.onTap,
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
          onChanged: widget.onChanged ?? (value) {},
          textInputAction: widget.textInputAction ?? TextInputAction.none,
          maxLength: widget.maxLength ?? 100,
          autofocus: true,
          controller: widget.controller,
          maxLines: widget.maxLines ?? 1,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          cursorColor: lightColorScheme.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.obscureTextCheck ?? false,
          validator: widget.validator,
          decoration: InputDecoration(
            counterText: widget.maxLength == null ? "" : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: lightColorScheme.outline),
            focusColor: lightColorScheme.primary,
            suffixIcon: widget.suffixIcon != null
                ? GestureDetector(
                    onTap: widget.suffixIconOnPressed ?? () {},
                    child: widget.suffixIcon,
                  )
                : null,
          ),
          onEditingComplete: widget.onEditingComplete ?? () {},
          onTap: widget.onTap ?? () {},
      ),
    );
  }
}
