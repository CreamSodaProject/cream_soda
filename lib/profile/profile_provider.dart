import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_state.dart';

class ProfileProvider extends ChangeNotifier {
  final state = ProfileState();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await state.picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      state.image = XFile(pickedFile.path);
      state.existPhoto = true;
      notifyListeners();
    }
  }

  void deletePhoto() {
    state.image = null;
    state.existPhoto = false;
    notifyListeners();
  }

  bool isNameValid(String password) {
    // 정규식 패턴: 최소 8자 이상, 숫자와 특수 문자 필수 포함
    const pattern = r'^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9]{2,10}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }
}
