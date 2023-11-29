import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class JoinState {

  JoinState() {
    // init some variables
  }
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Color checkLengthColor = lightColorScheme.outline;
  Color checkRegColor = lightColorScheme.outline;

  bool emailOnTapCheck = false;
  bool passwordOnTapCheck = false;
  bool passwordCheckOnTapCheck = false;

  bool passwordObscureTextCheck = true;
  bool passwordCheckObscureTextCheck = true;

  Color emailIconColor = lightColorScheme.outline;
  Color passwordIconColor = lightColorScheme.outline;
  Color passwordCheckIconColor = lightColorScheme.outline;

  IconData passwordIcon =  Icons.visibility_off;
  IconData passwordCheckIcon =  Icons.visibility_off;
}
