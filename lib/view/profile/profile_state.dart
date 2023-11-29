import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileState {

  ProfileState() {
    // init some variables
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  var email = '';
  var password = '';

  XFile? image;
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  bool existPhoto = false;

}
