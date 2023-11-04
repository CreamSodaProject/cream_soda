import 'package:flutter/cupertino.dart';

class LoginState {

  LoginState() {
    // init some variables
  }

  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
