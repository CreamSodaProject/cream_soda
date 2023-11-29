import 'package:cream_soda/view/common_widget/use_alert_dialog.dart';
import 'package:cream_soda/view/common_widget/use_elevated_button.dart';
import 'package:cream_soda/view/common_widget/use_outlined_button.dart';
import 'package:cream_soda/view/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final state = provider.state;

    return Form(
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
                Text("*",
                    style: TextStyle(
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
                  if (value == null || value.isEmpty) {
                    return "이름을 입력해주세요.";
                  }
                  if (!provider.isNameValid(value)) {
                    return "이름은 2~10자로 입력해주세요.";
                  }
                  return null;
                }),
            UseElevatedButton(
              title: "등록",
              onPressed: () {
                if (state.formKey.currentState!.validate()) {
                  provider.join(context);
                }
              },
            ),
            UseOutlinedButton(
                title: "취소",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => UseAlertDialog(
                        title: "등록을 취소하시겠습니까?",
                        content: "기입한 정보가 모두 사라집니다.",
                        confirmFunction: () {
                          Navigator.popAndPushNamed(
                              context, Move.mainPage);
                        },
                        cancelFunction: () {
                          Navigator.pop(context);
                        },
                      ));
                }),
          ],
        ));
  }
}
