import 'package:cream_soda/view/common_widget/use_elevated_button.dart';
import 'package:cream_soda/view/common_widget/use_page_title_text.dart';
import 'package:cream_soda/view/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/login/components/info_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<LoginProvider>();
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultHorizonGap,
          vertical: defaultVerticalGap,
        ),
        child: Column(
          children: [
            UsePageTitleText(title: "로그인"),
            const SizedBox(height: gap35),
            Form(
                key: state.formKey,
                child: Column(
                  children: [
                    UseTextFormField(
                      controller: state.addressController,
                      hintText: "이메일",
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
                      // textInputAction: TextInputAction.next,
                      // onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      onTap: () {
                        provider.changeEmailOnTapCheck(true);
                        provider.changePasswordOnTapCheck(false);
                      },
                      suffixIcon: Icon(
                        CupertinoIcons.clear_circled_solid,
                        color: state.emailIconColor,
                        size: size18,
                      ),
                      suffixIconOnPressed: state.emailOnTapCheck
                          ? () {
                              state.addressController.clear();
                            }
                          : null,
                    ),
                    UseTextFormField(
                        controller: state.passwordController, hintText: "비밀번호",
                    keyboardType: TextInputType.visiblePassword,
                    obscureTextCheck: state.passwordObscureText,
                      onTap: () {
                        provider.changeEmailOnTapCheck(false);
                        provider.changePasswordOnTapCheck(true);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "비밀번호를 입력해주세요.";
                        }
                        return null;
                      },
                      suffixIcon: Icon(
                        state.passwordIcon,
                        color: state.passwordIconColor,
                        size: size18,
                      ),
                      suffixIconOnPressed: state.passwordOnTapCheck ? () {
                        provider.changePasswordObscureText(!state.passwordObscureText);
                      } : null,
                    ),
                    const SizedBox(height: gap15),
                    UseElevatedButton(
                        title: "로그인",
                        onPressed: () {
                          if (state.formKey.currentState!.validate()) {
                            provider.login(context);
                          }
                        }),
                    const SizedBox(height: gap25),
                  ],
                )),
            Column(
              children: [
                InfoButton(
                    infoText: "비밀번호를 잊으셨나요?",
                    buttonTitle: "임시 비밀번호 받기",
                    onPressed: () {
                      Navigator.pushNamed(context, Move.sparePasswordPage);
                    }),
                const SizedBox(height: gap8),
                InfoButton(
                  infoText: "아직 계정이 없으신가요?",
                  buttonTitle: "회원가입",
                  onPressed: () {
                    Navigator.pushNamed(context, Move.joinPage);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
