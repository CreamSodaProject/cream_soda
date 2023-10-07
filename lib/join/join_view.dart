import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/other_colors.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/join/components/info_text.dart';
import 'package:cream_soda/join/components/join_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'join_provider.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => JoinProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<JoinProvider>();
    final state = provider.state;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
            // title: const Text("계정 등록"),
              centerTitle: true,
              titleTextStyle: const TextStyle(
                  fontSize: font16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: defaultVerticalGap, horizontal: defaultHorizonGap),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  JoinForm(provider: provider, state: state),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("계정이 있으신가요?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // TODO : 로그인 페이지로 이동 추가
                        },
                        child: Text("로그인",
                            style: TextStyle(color: lightColorScheme.primary)),
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
