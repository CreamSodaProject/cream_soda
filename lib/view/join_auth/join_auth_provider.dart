import 'dart:async';
import 'dart:convert';

import 'package:cream_soda/view/common_widget/use_confirm_dialog.dart';
import 'package:cream_soda/constants/enum/code_status_enum.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'join_auth_state.dart';

class JoinAuthProvider extends ChangeNotifier {
  final state = JoinAuthState();
  final repository = UserRepository();

  void init(BuildContext context, String? email, String? password) async {
    state.email = email ?? "";
    state.password = password ?? "";
    notifyListeners();
    sendEmail(context);
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

  Future<void> reSendEmail(BuildContext context) async {
    var response = await repository.sendEmail(email: state.email);
    var responseBody = jsonDecode(response.body);

    if (!context.mounted) return;

    if (response.statusCode == 200) {
      resetCountdown();
      startCountdown();
      state.pinController.text = "";
      showDialog(
        context: context,
        builder: (context) => UseConfirmDialog(
          title: "전송 완료",
          content: "코드 재전송이 완료되었습니다.",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      resetCountdown();
      var detail = responseBody['detail'];
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => UseConfirmDialog(
                title: "전송 실패",
                content: detail ?? "관리자에게 문의하세요",
                onPressed: () {
                  Navigator.pop(context);
                },
              ));
    }
  }

  Future<void> sendEmail(BuildContext context) async {
    var response = await repository.sendEmail(email: state.email);
    var responseBody = jsonDecode(response.body);

    if (!context.mounted) return;

    if (response.statusCode == 200) {
      resetCountdown();
      startCountdown();
    } else {
      resetCountdown();
      var detail = responseBody['detail'];
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => UseConfirmDialog(
                title: "전송 실패",
                content: detail ?? "관리자에게 문의하세요",
                onPressed: () {
                  Navigator.pop(context);
                },
              ));
    }
  }

  Future<void> sendCode(BuildContext context, String pin) async {
    var response = await repository.sendCode(email: state.email, code: pin);
    // var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      state.verified = CodeStatusEnum.SUCCESS;
      notifyListeners();
      Navigator.pushNamed(context, Move.profilePage,
          arguments: {'email': state.email, 'password': state.password});
    } else {
      state.verified = CodeStatusEnum.FAIL;
      notifyListeners();
    }
  }
}
