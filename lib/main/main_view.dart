import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_outlined_button.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<MainProvider>();
    final state = provider.state;

    return SafeArea(
      child: Scaffold(
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              width: double.infinity,
              color: lightColorScheme.onPrimary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    // TODO : 로고 이미지 넣기
                    child: Image.asset("assets/images/logo2.png"),
                  ),
                  // TODO : 로고 이미지 삽입 시 수정
                  const Text("CREAM SODA",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  UseOutlinedButton(
                      title: "회원가입",
                      onPressed: () {
                        Navigator.pushNamed(context, Move.joinPage);

                      }),
                  UseElevatedButton(title: "로그인", onPressed: () {
                    Navigator.pushNamed(context, Move.loginPage);
                  }),
                ],
              ))),
    );
  }
}
