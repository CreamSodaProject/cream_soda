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
