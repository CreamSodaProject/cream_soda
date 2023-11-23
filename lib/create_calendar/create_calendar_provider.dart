import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cream_soda/common_widget/use_confirm_dialog.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/repository/calendar_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'create_calendar_state.dart';

class CreateCalendarProvider extends ChangeNotifier {
  final state = CreateCalendarState();
  final repository = CalendarRepository();

  bool isNameValid(String password) {
    // 정규식 패턴: 최소 2자리, 최대 10자리
    const pattern = r'^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9]{2,10}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await state.picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      //   state.image = XFile(pickedFile.path);
      state.imageFile = File(pickedFile.path);
      state.existPhoto = true;

      notifyListeners();
    }
  }

  void deletePhoto() {
    // state.image = null;
    state.imageFile = null;
    state.existPhoto = false;
    notifyListeners();
  }

  Future<void> createCalendar(BuildContext context) async {
    String base64string = "";

    // TODO : 기본 이미지 추가 필요
    if (state.imageFile != null) {
      Uint8List imageBytes = await state.imageFile!.readAsBytes();
      base64string = base64.encode(imageBytes);
    }
    var response = await repository.saveCalendar(
        name: state.nameController.text, imageFile: base64string);
    var responseBody = jsonDecode(response.body);
    var detail = responseBody['detail'];

    if (response.statusCode == 200) {
      Navigator.popAndPushNamed(context, Move.navigatorPage);
    } else {
      showDialog(
        context: context,
        builder: (context) => UseConfirmDialog(
            title: "캘린더 생성 실패",
            content: detail ?? "관리자에게 문의하세요.",
            onPressed: () {
              Navigator.pop(context);
            }),
      );
    }
  }
}
