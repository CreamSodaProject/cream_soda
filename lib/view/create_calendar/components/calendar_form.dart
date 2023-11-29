import 'package:cream_soda/view/common_widget/use_elevated_button.dart';
import 'package:cream_soda/view/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/create_calendar/create_calendar_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CalendarForm extends StatelessWidget {
  const CalendarForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreateCalendarProvider>();
    final state = provider.state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultHorizonGap, vertical: defaultVerticalGap),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "이름",
                style: TextStyle(
                    fontSize: font14,
                    color: lightColorScheme.outline,
                    fontWeight: FontWeight.bold),
              ),
              Text("*",
                  style: TextStyle(
                      fontSize: font14,
                      color: lightColorScheme.error,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Form(
            key: state.formKey,
            child: Column(
              children: [
                UseTextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    controller: state.nameController,
                    hintText: "필수",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "이름을 입력해주세요.";
                      }
                      if (!provider.isNameValid(value)) {
                        return "이름은 2~10자로 입력해주세요.";
                      }
                      return null;
                    }),
                UseElevatedButton(title: "저장", onPressed: (){
                  if (state.formKey.currentState!.validate()) {
                    provider.createCalendar(context);
                  }
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
