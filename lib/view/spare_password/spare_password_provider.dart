import 'dart:convert';

import 'package:cream_soda/view/common_widget/use_confirm_dialog.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'spare_password_state.dart';

class SparePasswordProvider extends ChangeNotifier {
  final state = SparePasswordState();
  final repository = UserRepository();

  void changeOnTapCheck(bool value) {
    state.onTapCheck = value;

    if (value) {
      state.iconColor = lightColorScheme.primary;
    } else {
      state.iconColor = lightColorScheme.outline;
    }
    notifyListeners();
  }

  Future<void> sendSparePassword(BuildContext context) async {
    var response =
       await repository.sendSparePassword(email: state.addressController.text);
    var responseBody = jsonDecode(response.body);
    var detail = responseBody['detail'];
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) => UseConfirmDialog(
            title: "전송 완료",
            content: detail ?? "로그인 페이지로 이동합니다.",
            onPressed: () {
              Navigator.popAndPushNamed(context, Move.loginPage);
            },
          ));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => UseConfirmDialog(
            title: "전송 실패",
            content: detail ?? "관리자에게 문의해주세요.",
            onPressed: () {
              Navigator.pop(context);
            },
          ));
    }
  }
}
