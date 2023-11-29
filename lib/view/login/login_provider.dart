import 'dart:convert';

import 'package:cream_soda/view/common_widget/use_confirm_dialog.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/repository/user_repository.dart';
import 'package:cream_soda/constants/secure_storage/secure_storage.dart';
import 'package:cream_soda/constants/secure_storage/secure_storage_enum.dart';
import 'package:flutter/material.dart';

import 'login_state.dart';

class LoginProvider extends ChangeNotifier {
  final state = LoginState();
  final repository = UserRepository();

  void changeEmailOnTapCheck(bool check) {
    state.emailOnTapCheck = check;
    if (check) {
      state.emailIconColor = lightColorScheme.primary;
    } else {
      state.emailIconColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changePasswordOnTapCheck(bool check) {
    state.passwordOnTapCheck = check;
    if (check) {
      state.passwordIconColor = lightColorScheme.primary;
    } else {
      state.passwordIconColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  void changePasswordObscureText(bool check) {
    state.passwordObscureText = check;
    if (check) {
      state.passwordIcon = Icons.visibility_off;
    } else {
      state.passwordIcon = Icons.visibility;
    }
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    var response = await repository.login(
        email: state.addressController.text,
        password: state.passwordController.text);

    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // TODO : 스토리지 저장
      var jwtToken = response.headers['Authorization'];

      if(jwtToken != null) {
        SecureStorage.setKey(SecureStorageEnum.jwtToken, jwtToken);
      }

      // TODO : 캘린더 생성 OR 가져오기
    } else {
      var detail = responseBody['detail'];
      showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              UseConfirmDialog(
                title: "로그인 실패",
                content: detail ?? "관리자에게 문의하세요",
                onPressed: () {
                  Navigator.pop(context);
                },
              ));
    }
  }
}
