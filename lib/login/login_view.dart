import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_button.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/login/components/info_button.dart';
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
    final provider = context.read<LoginProvider>();
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
                        controller: state.addressController, hintText: "이메일"),
                    UseTextFormField(
                        controller: state.passwordController, hintText: "비밀번호"),
                    const SizedBox(height: gap15),
                    UseElevatedButton(title: "로그인", onPressed: () {}),
                    const SizedBox(height: gap25),
                  ],
                )),
            Column(
              children: [
                InfoButton(
                    infoText: "비밀번호를 잊으셨나요?",
                    buttonTitle: "임시 비밀번호 받기",
                    onPressed: () {}),
                const SizedBox(height: gap8),
                InfoButton(
                  infoText: "아직 계정이 없으신가요?",
                  buttonTitle: "회원가입",
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
