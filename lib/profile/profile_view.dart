import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final state = provider.state;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultVerticalGap, horizontal: defaultHorizonGap),
            child: Column(
              children: [
                UsePageTitleText(title: "프로필 편집"),
                IconButton(
                    onPressed: () {
                      // TODO: 프로필 이미지 변경
                    },
                    icon: Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_plus,
                      size: 150,
                      color: lightColorScheme.outline,
                    )),
                Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "이름",
                              style: TextStyle(
                                  fontSize: font14,
                                  color: lightColorScheme.outline,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("*", style: TextStyle(
                                fontSize: font14,
                                color: lightColorScheme.error,
                                fontWeight: FontWeight.bold))
                          ],
                        ),
                        UseTextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.text,
                            controller: state.nameController,
                            hintText: "필수",
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return "이름을 입력해주세요.";
                              }
                              if(!isNameValid(value)){
                                return "이름은 2~10자로 입력해주세요.";
                              }
                              return null;
                            }),
                        UseElevatedButton(title: "등록", onPressed: (){})
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

bool isNameValid(String password) {
  // 정규식 패턴: 최소 8자 이상, 숫자와 특수 문자 필수 포함
  const pattern = r'^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9]{2,10}$';
  final regExp = RegExp(pattern);

  return regExp.hasMatch(password);
}
