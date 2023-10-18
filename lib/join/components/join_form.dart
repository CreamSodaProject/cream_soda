import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/other_color.dart';
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
    final provider = context.watch<JoinProvider>();
    final state = provider.state;

    return  Form(
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
              },
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>  FocusScope.of(context).nextFocus(),
          ),
          UseTextFormField(
              controller: widget.state.passwordController,
              hintText: "비밀번호",
              keyboardType: TextInputType.visiblePassword,
              obscureTextCheck: true,
              onChanged: (p0) {
                if (p0.length < 8) {
                  provider.changeLengthInfoColor(lightColorScheme.outline);
                  provider.changeRegInfoColor(lightColorScheme.outline);
                  return;
                }
                provider.changeLengthInfoColor(rightColor);

                if (!provider.isPasswordValid(p0)) {
                  provider.changeRegInfoColor(lightColorScheme.outline);
                  return;
                }
                provider.changeRegInfoColor(rightColor);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                }

                if (value.length < 8) {
                  return "비밀번호는 8자 이상이어야 합니다.";
                }

                if (!provider.isPasswordValid(value)) {
                  return "비밀번호는 숫자, 특수 문자를 필수로 포함해야 합니다.";
                }

                return null;
              },
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>  FocusScope.of(context).nextFocus(),
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
              },
            // onEditingComplete: () {
            //   if(widget.state.formKey.currentState!.validate()){
            //     Navigator.pushNamed(context, "/joinAuth");
            //   }
            // },
          ),
          const SizedBox(height: gap15),
          InfoText(title: "8자 이상 입력", color: widget.state.checkLengthColor),
          const SizedBox(height: gap5),
          InfoText(title: "숫자, 특수 문자 필수 포함", color: widget.state.checkRegColor),
          const SizedBox(height: defaultVerticalGap),
          UseElevatedButton(title: "다음", onPressed: () {
            if(widget.state.formKey.currentState!.validate()){
              provider.sendCode(context);
            }
          },)
        ],
      ),
    );
  }
}


