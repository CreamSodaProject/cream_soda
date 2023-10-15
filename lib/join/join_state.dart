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
}
