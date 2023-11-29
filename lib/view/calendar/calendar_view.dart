import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/calendar/components/calendar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_provider.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CalendarProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<CalendarProvider>();
    final state = provider.state;
    // TODO : 수정 중
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultHorizonGap, vertical: defaultVerticalGap),
            child: CalendarTitle(),
          ),
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(9999, 12, 31),
            focusedDay: DateTime.now(),
            locale: 'ko_KR',
          ),
        ],
      ),
    ));
  }
}
