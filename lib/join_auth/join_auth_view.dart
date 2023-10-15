import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'join_auth_provider.dart';

class JoinAuthPage extends StatelessWidget {

  const JoinAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => JoinAuthProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<JoinAuthProvider>();
    final state = provider.state;

    return SafeArea(child: Scaffold(
      appBar : AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          UsePageTitleText(title: "계정 인증"),
          const Text("이메일로 인증번호를 보냈습니다.\n인증번호를 입력해주세요."),
        ],
      ),
    ));
    // return Container(
    //   child: Text("JoinAuthPage", style: TextStyle(color: Colors.white)),
    // );
  }
}