import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/other_color.dart';
import 'package:cream_soda/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'join_state.dart';

class JoinProvider extends ChangeNotifier {
  final state = JoinState();
  final repository = UserRepository();


  bool isPasswordValid(String password) {
    // 정규식 패턴: 최소 8자 이상, 숫자와 특수 문자 필수 포함
    const pattern =
        r'^(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  void changePasswordLengthColor(bool check) {
    if(check) {
      state.checkLengthColor = rightColor;
    } else {
      state.checkLengthColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changePasswordRegColor(bool check) {
    if(check) {
      state.checkRegColor = rightColor;
    } else {
      state.checkRegColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changeEmailOnTapCheck(bool check) {
    state.emailOnTapCheck = check;
    state.passwordOnTapCheck = !check;
    state.passwordCheckOnTapCheck = !check;
    if(check) {
      state.emailIconColor = lightColorScheme.primary;
      state.passwordIconColor = lightColorScheme.outline;
      state.passwordCheckIconColor = lightColorScheme.outline;
    } else {
      state.emailIconColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changePasswordOnTapCheck(bool check) {
    state.passwordOnTapCheck = check;
    state.emailOnTapCheck = !check;
    state.passwordCheckOnTapCheck = !check;

    if(check) {
      state.passwordIconColor = lightColorScheme.primary;
      state.emailIconColor = lightColorScheme.outline;
      state.passwordCheckIconColor = lightColorScheme.outline;
    } else {
      state.passwordIconColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changePasswordCheckOnTapCheck(bool check) {
    state.passwordCheckOnTapCheck = check;
    state.emailOnTapCheck = !check;
    state.passwordOnTapCheck = !check;
    if(check) {
      state.passwordCheckIconColor = lightColorScheme.primary;
      state.emailIconColor = lightColorScheme.outline;
      state.passwordIconColor = lightColorScheme.outline;
    } else {
      state.passwordCheckIconColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changePasswordObscureTextCheck(bool check) {
    state.passwordObscureTextCheck = check;
    if(check) {
      state.passwordIcon = Icons.visibility_off;
    } else {
      state.passwordIcon = Icons.visibility;
    }
    notifyListeners();
  }

  void changePasswordCheckObscureTextCheck(bool check) {
    state.passwordCheckObscureTextCheck = check;
    if(check) {
      state.passwordCheckIcon = Icons.visibility_off;
    } else {
      state.passwordCheckIcon = Icons.visibility;
    }
    notifyListeners();
  }

}
