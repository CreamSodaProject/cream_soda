import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final state = provider.state;

    void _showDialog(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Column(
            children: [
              UsePageTitleText(title: "프로필 편집"),
              IconButton(
                  onPressed: () {
                    // TODO: 프로필 이미지 변경
                  },
                  icon: Icon(
                    CupertinoIcons.person_crop_circle_fill_badge_plus,
                    size: 150,
                    color: lightColorScheme.outline,
                  )),
              Form(
                  key: state.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text("*", style: TextStyle(
                              fontSize: font14,
                              color: lightColorScheme.error,
                              fontWeight: FontWeight.bold))
                        ],
                      ),
                      UseTextFormField(
                          controller: state.nameController,
                          hintText: "필수",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "이름을 입력해주세요.";
                            }
                            return null;
                          }),
                      Text("생년월일", style: TextStyle(
                          fontSize: font14,
                          color: lightColorScheme.outline,
                          fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(defaultHorizonGap),
                          color: lightColorScheme.primary,
                          onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              showDayOfWeek: true,
                              onDateTimeChanged: (DateTime newDate) {
                               provider.birthDaySelect('${newDate.year}-${newDate.month}-${newDate.day}');
                              },
                            ),
                          ),
                          child: Text(
                            state.birthDay,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}


