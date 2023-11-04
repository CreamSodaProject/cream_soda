import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/join_auth/join_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodeForm extends StatefulWidget {
  const CodeForm({super.key});

  @override
  State<CodeForm> createState() => _CodeFormState();
}

class _CodeFormState extends State<CodeForm> {
  @override
  Widget build(BuildContext context) {

    final provider = JoinAuthProvider();
    final state = provider.state;

    return Form(
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
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (pin) {
            // 통신
             Navigator.popAndPushNamed(context, "/profile", arguments: {
               'email' : state.email,
               'password' : state.password
             });
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
              border: Border.all(color: lightColorScheme.primary),
            ),
          ),
          submittedPinTheme: state.defaultPinTheme.copyWith(
            decoration: state.defaultPinTheme.decoration!.copyWith(
              color: lightColorScheme.primary,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: lightColorScheme.primary),
            ),
          ),
          errorPinTheme: state.defaultPinTheme.copyBorderWith(
            border: Border.all(color: lightColorScheme.error),
          ),
        ),
      ),
    );
  }
}
