import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cream_soda/common_widget/use_confirm_dialog.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_state.dart';

class ProfileProvider extends ChangeNotifier {
  final state = ProfileState();
  final repository = UserRepository();

  void init(String? email, String? password) {
    state.email = email ?? "";
    state.password = password ?? "";
    notifyListeners();
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

  bool isNameValid(String password) {
    // 정규식 패턴: 최소 2자리, 최대 10자리
    const pattern = r'^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9]{2,10}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  Future<void> join(BuildContext context) async {
    String base64string = "";

    // TODO : 기본 이미지 추가 필요
    if (state.imageFile != null) {
      Uint8List imageBytes = await state.imageFile!.readAsBytes();
      base64string = base64.encode(imageBytes);
    }

    var response = await repository.join(
      email: state.email,
      password: state.password,
      name: state.nameController.text,
      imageFile: base64string,
    );

    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => UseConfirmDialog(
            title: "회원가입 성공",
            content: "회원가입에 성공하였습니다.",
            onPressed: () => Navigator.popAndPushNamed(context, Move.loginPage)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => UseConfirmDialog(
            title: "회원가입 실패",
            content: responseBody['detail'],
            onPressed: () => Navigator.pop(context)),
      );
    }
  }
}
