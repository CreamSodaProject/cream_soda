import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginState {

  LoginState() {
    // init some variables
  }

  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool emailOnTapCheck = false;
  bool passwordOnTapCheck = false;

  bool passwordObscureText = true;

  IconData passwordIcon =  Icons.visibility_off;

  Color emailIconColor = lightColorScheme.outline;
  Color passwordIconColor = lightColorScheme.outline;
}
