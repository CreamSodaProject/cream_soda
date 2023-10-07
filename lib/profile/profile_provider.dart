import 'package:flutter/material.dart';

import 'profile_state.dart';

class ProfileProvider extends ChangeNotifier {
  final state = ProfileState();

  void birthDaySelect (value) {
    state.birthDay = value;
    notifyListeners();
  }

  }

