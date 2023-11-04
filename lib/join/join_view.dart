import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/join/components/join_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'join_provider.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
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
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/main");
                },
              ),),
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
                          provider.goLogin(context);
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
