import 'dart:convert';

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
    const pattern = r'^(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  Future<void> sendCode(BuildContext context) async {
    var response = await repository.sendEmail(email: state.addressController.text);

    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var sendCode = jsonResponse['code'];
       Navigator.pushNamed(context, "/joinAuth", arguments: {'sendCode : $sendCode'});
    } else if(response.statusCode == 401 || response.statusCode == 403){

    }

  }
}
