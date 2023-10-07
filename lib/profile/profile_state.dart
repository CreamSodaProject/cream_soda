import 'package:flutter/material.dart';

class ProfileState {

  ProfileState() {
    // init some variables
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  String birthDay = "";
}
