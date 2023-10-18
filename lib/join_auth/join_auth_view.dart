import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'join_auth_provider.dart';

class JoinAuthPage extends StatefulWidget {

  const JoinAuthPage({super.key});

  @override
  State<JoinAuthPage> createState() => _JoinAuthPageState();
}
// TODO : 코드 보내지는 거 보고 수정해야 함~
class _JoinAuthPageState extends State<JoinAuthPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (BuildContext context) => JoinAuthProvider(),
          builder: (context, child) =>  _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<JoinAuthProvider>();
    final state = provider.state;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
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
          Form(
            key: state.formKey,
            child: Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                autofocus: true,
                length: 5,
                controller: state.pinController,
                focusNode: state.focusNode,
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: state.defaultPinTheme,
                validator: (value) {
                 // return value == widget.pin ? null : '비밀번호가 일치하지 않습니다.';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {

                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: lightColorScheme.primary,
                    ),
                  ],
                ),
                focusedPinTheme: state.defaultPinTheme.copyWith(
                  decoration: state.defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(19),
                    border:
                    Border.all(color: lightColorScheme.primary),
                  ),
                ),
                submittedPinTheme: state.defaultPinTheme.copyWith(
                  decoration: state.defaultPinTheme.decoration!.copyWith(
                    color: lightColorScheme.primary,
                    borderRadius: BorderRadius.circular(19),
                    border:
                    Border.all(color: lightColorScheme.primary),
                  ),
                ),
                errorPinTheme: state.defaultPinTheme.copyBorderWith(
                  border: Border.all(color: lightColorScheme.error),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
    // return Container(
    //   child: Text("JoinAuthPage", style: TextStyle(color: Colors.white)),
    // );
  }
}