import 'package:cream_soda/view/common_widget/use_elevated_button.dart';
import 'package:cream_soda/view/common_widget/use_page_title_text.dart';
import 'package:cream_soda/constants/enum/code_status_enum.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/join_auth/components/code_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'join_auth_provider.dart';

class JoinAuthPage extends StatefulWidget {

  JoinAuthPage({super.key});

  @override
  State<JoinAuthPage> createState() => _JoinAuthPageState();
}

// TODO : 코드 보내지는 거 보고 수정해야 함~
class _JoinAuthPageState extends State<JoinAuthPage> {

  @override
  Widget build(BuildContext context) {
    Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final email =args['email'];
    final password = args['password'];

    return ChangeNotifierProvider(
      create: (BuildContext context) => JoinAuthProvider()..init(context, email, password),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {

    final provider = context.watch<JoinAuthProvider>();
    final state = provider.state;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultVerticalGap, horizontal: defaultHorizonGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UsePageTitleText(title: "계정 인증"),
              const SizedBox(
                height: gap35,
              ),
              const Text("이메일로 인증번호를 보냈습니다.\n인증번호를 입력해주세요.", textAlign: TextAlign.center,),
              const SizedBox(
                height: gap35,
              ),
              CodeForm(),
              const SizedBox(
                height: gap10,
              ),
              Text(
                '${provider.state.duration.inMinutes.remainder(60)}:${provider.state.duration.inSeconds.remainder(60)}',
                style: TextStyle(color: lightColorScheme.error),
              ),
              const SizedBox(
                height: gap10,
              ),
              if(state.verified == CodeStatusEnum.FAIL)
                 Padding(
                   padding: const EdgeInsets.only(top : gap10),
                   child: Text('인증이 실패하였습니다.',
                      style: TextStyle(color: lightColorScheme.error)),
                 ),
              const SizedBox(
                height: gap10,
              ),
              UseElevatedButton(
                title: "재전송",
                onPressed: () {
                  provider.reSendEmail(context);
                },
                width: 100,
              )
            ],
          ),
        ),
      ),
    ));
    // return Container(
    //   child: Text("JoinAuthPage", style: TextStyle(color: Colors.white)),
    // );
  }


}
