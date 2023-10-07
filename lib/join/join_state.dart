import 'package:flutter/material.dart';

class JoinState {

  JoinState() {
    // init some variables
  }
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
