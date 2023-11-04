import 'dart:convert';

import 'package:cream_soda/common_widget/use_confirm_dialog.dart';
import 'package:cream_soda/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'join_state.dart';

class JoinProvider extends ChangeNotifier {
  final state = JoinState();
  final repository = UserRepository();

  void changeLengthInfoColor(value) {
    state.checkLengthColor = value;
    notifyListeners();
  }

  void changeRegInfoColor(value) {
    state.checkRegColor = value;
    notifyListeners();
  }

  bool isPasswordValid(String password) {
    // 정규식 패턴: 최소 8자 이상, 숫자와 특수 문자 필수 포함
    const pattern =
        r'^(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  Future<void> sendCode(BuildContext context) async {
    var response =
        await repository.sendEmail(email: state.addressController.text);

    var responseBody = jsonDecode(response.body);

    if (!context.mounted) return;

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, "/joinAuth", arguments: {
        'email': state.addressController.text,
        'password': state.passwordController.text
      });
    } else {
      print("object : ${responseBody['code']}");
      var detail = responseBody['detail'];
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => UseConfirmDialog(
                title: "회원가입 실패",
                content: detail ?? "회원가입에 실패했습니다.",
                onPressed: () {
                  Navigator.pop(context);
                },
              ));
    }
  }

  void changeEmailIconColor(color) {
    state.emailIconColor = color;
    notifyListeners();
  }

  void changePasswordIconColor(color) {
    state.passwordIconColor = color;
    notifyListeners();
  }

  void changePasswordCheckIconColor(color) {
    state.passwordCheckIconColor = color;
    notifyListeners();
  }

  void changePasswordIcon(icon) {
    state.passwordIcon = icon;
    notifyListeners();
  }

  void changePasswordCheckIcon(icon) {
    state.passwordCheckIcon = icon;
    notifyListeners();
  }

  void changeEmailOnTapCheck(bool value) {
    state.emailOnTapCheck = value;
    notifyListeners();
  }

  void changePasswordOnTapCheck(bool value) {
    state.passwordOnTapCheck = value;
    notifyListeners();
  }

  void changePasswordCheckOnTapCheck(bool value) {
    state.passwordCheckOnTapCheck = value;
    notifyListeners();
  }

  void goLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
}
