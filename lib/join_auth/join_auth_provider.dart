import 'dart:async';

import 'package:cream_soda/constants/enum/code_status_enum.dart';
import 'package:flutter/material.dart';

import 'join_auth_state.dart';

class JoinAuthProvider extends ChangeNotifier {
  final state = JoinAuthState();

  void init() {
    // state.email = email;
    // state.password = password;
    // state.verified = verified;

    resetCountdown();
    startCountdown();
    notifyListeners();
  }

  void startCountdown() {
    state.timer = Timer.periodic(state.oneSecond, (Timer timer) {
      if (state.duration.inSeconds <= 0) {
        timer.cancel();
        state.isCounting = true;
        state.verified = CodeStatusEnum.FAIL;
        notifyListeners();
      } else {
        state.duration -= state.oneSecond;
        notifyListeners();
      }
    });
  }

  void resetCountdown() {
    state.timer?.cancel();
    state.duration = const Duration(minutes: 3);
    state.verified = CodeStatusEnum.WATING;
    state.isCounting = false;
    notifyListeners();
  }
}
