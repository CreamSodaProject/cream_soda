import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/join/components/info_text.dart';
import 'package:cream_soda/join/join_provider.dart';
import 'package:cream_soda/join/join_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinForm extends StatefulWidget {
  JoinProvider provider;
  JoinState state;

   JoinForm({required this.state, required this.provider, super.key});

  @override
  State<JoinForm> createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {

  @override
  Widget build(BuildContext context) {
    return                   Form(
      key: widget.state.formKey,
      child: Column(
        children: [
          UsePageTitleText(title: "계정 등록",),
          const SizedBox(height: gap35),
          UseTextFormField(
              controller: widget.state.addressController,
              hintText: "이메일 주소",
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "이메일 주소를 입력해주세요.";
                }
                if (!value.contains("@")) {
                  return "이메일 주소 형식이 아닙니다.";
                }
                return null;
              }),
          UseTextFormField(
              controller: widget.state.passwordController,
              hintText: "비밀번호",
              keyboardType: TextInputType.visiblePassword,
              obscureTextCheck: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                }
                if (value.length < 8) {
                  return "비밀번호는 8자 이상이어야 합니다.";
                }
                if (!isPasswordValid(value)) {
                  return "비밀번호는 숫자, 특수 문자를 필수로 포함해야 합니다.";
                }
                return null;
              }
          ),
          UseTextFormField(
              controller: widget.state.checkPasswordController,
              hintText: "비밀번호 확인",
              keyboardType: TextInputType.visiblePassword,
              obscureTextCheck: true,
              validator: (value) {
                if (widget.state.passwordController.text != value) {
                  return "비밀번호가 일치하지 않습니다.";
                }
                return null;
              }
          ),
          const SizedBox(height: gap15),
          InfoText(title: "8자 이상 입력"),
          const SizedBox(height: gap5),
          InfoText(title: "숫자, 특수 문자 필수 포함"),
          const SizedBox(height: defaultVerticalGap),
          UseElevatedButton(title: "등록", onPressed: () {
            if(widget.state.formKey.currentState!.validate()){
              Navigator.pushNamed(context, "/profile");
            }

          },)
        ],
      ),
    );
  }
}


bool isPasswordValid(String password) {
  // 정규식 패턴: 최소 8자 이상, 숫자와 특수 문자 필수 포함
  const pattern = r'^(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$';
  final regExp = RegExp(pattern);

  return regExp.hasMatch(password);
}