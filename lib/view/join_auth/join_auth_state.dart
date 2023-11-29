import 'dart:async';

import 'package:cream_soda/constants/enum/code_status_enum.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';

class JoinAuthState {

  JoinAuthState() {
    // init some variables
  }
  // TextEditingController codeController = TextEditingController();
  var pinController = TextEditingController();
  var focusNode = FocusNode();
  var formKey = GlobalKey<FormState>();
  Duration duration = const Duration(minutes: 3, seconds: 0);
  var verified= CodeStatusEnum.WATING;
  Timer? timer;
  var oneSecond = const Duration(seconds: 1);
  bool isCounting = true;

  var email = '';
  var password = '';

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: font20,
      color: Color.fromRGBO(255, 255, 255, 1.0),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: lightColorScheme.outline),
    ),
  );
}
