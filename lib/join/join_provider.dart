import 'package:flutter/material.dart';

import 'join_state.dart';

class JoinProvider extends ChangeNotifier {
  final state = JoinState();

  void changeLengthInfoColor(value) {
    state.checkLengthColor = value;
    notifyListeners();
  }

  void changeRegInfoColor(value) {
    state.checkRegColor = value;
    notifyListeners();
  }
}
