import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/create_calendar/components/calendar_form.dart';
import 'package:cream_soda/create_calendar/components/cover_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_calendar_provider.dart';

class CreateCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CreateCalendarProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<CreateCalendarProvider>();
    final state = provider.state;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 35),
          UsePageTitleText(title: "캘린더 만들기"),
          const SizedBox(height: 35),
          CoverImage(),
          CalendarForm(),
        ],
      ),
    ));
  }
}
