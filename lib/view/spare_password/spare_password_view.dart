import 'package:cream_soda/view/common_widget/use_elevated_button.dart';
import 'package:cream_soda/view/common_widget/use_page_title_text.dart';
import 'package:cream_soda/view/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'spare_password_provider.dart';

class SparePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SparePasswordProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<SparePasswordProvider>();
    final state = provider.state;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultHorizonGap, vertical: defaultVerticalGap),
        child: Column(
          children: [
            UsePageTitleText(title: "임시 비밀번호 받기"),
            const SizedBox(height: gap35),
            const Text(
              "임시 비밀번호를 받을\n이메일 주소를 입력해주세요.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: gap15),
            Form(
                key: state.formKey,
                child: Column(
                  children: [
                    UseTextFormField(
                        controller: state.addressController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "이메일 주소를 입력해주세요.";
                          }

                          if (!value.contains("@")) {
                            return "이메일 주소 형식이 아닙니다.";
                          }

                          return null;
                        },
                        suffixIcon: Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: state.iconColor,
                          size: size18,
                        ),
                        suffixIconOnPressed: state.onTapCheck
                            ? () {
                                state.addressController.clear();
                              }
                            : null,
                        onTap: () {
                          provider.changeOnTapCheck(true);
                        },
                        hintText: "이메일 주소"),
                    const SizedBox(height: gap10),
                    UseElevatedButton(title: "전송", onPressed: () {
                      if (state.formKey.currentState!.validate()) {
                        provider.sendSparePassword(context);
                      }
                    })
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
