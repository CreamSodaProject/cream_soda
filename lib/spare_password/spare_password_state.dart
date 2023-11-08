import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class SparePasswordState {

  SparePasswordState() {
    // init some variables
  }

  var formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  Color iconColor = lightColorScheme.outline;
  bool onTapCheck = false;
}
