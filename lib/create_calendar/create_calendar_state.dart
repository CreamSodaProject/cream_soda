import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class CreateCalendarState {

  CreateCalendarState() {
    // init some variables
  }
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  XFile? image;
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  bool existPhoto = false;
}
