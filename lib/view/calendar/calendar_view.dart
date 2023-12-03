import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/calendar/components/calendar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_provider.dart';

class CalendarPage extends StatefulWidget {
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;// 초기 값은 5주로 설정
  int _rowCount = 5;

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: defaultVerticalGap,
                  left: defaultHorizonGap,
                  right: defaultHorizonGap,
                  bottom: gap5),
              child: CalendarTitle(),
            ),
            TableCalendar(
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              // locale: 'ko_KR',
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(9999, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              calendarStyle: CalendarStyle(
                cellAlignment: Alignment.topCenter,
                cellPadding:
                    EdgeInsets.symmetric(horizontal: gap5, vertical: gap5),
                cellMargin: EdgeInsets.zero,
                selectedDecoration: BoxDecoration(
                  color: lightColorScheme.outline.withOpacity(0.2),
                  shape: BoxShape.rectangle,
                ),
                todayDecoration: BoxDecoration(
                  color: lightColorScheme.scrim,
                  shape: BoxShape.rectangle,
                ),
                selectedTextStyle: TextStyle(color: lightColorScheme.scrim),
                todayTextStyle: TextStyle(color: lightColorScheme.onPrimary),
                weekendTextStyle: TextStyle(color: lightColorScheme.error),
                // cellMargin: EdgeInsets.symmetric(horizontal: gap5, vertical: gap5),
                // cellPadding: EdgeInsets.symmetric(horizontal: gap5, vertical: gap5),
                holidayDecoration: BoxDecoration(
                  color: lightColorScheme.error.withOpacity(0.2),
                  shape: BoxShape.rectangle,
                ),
                canMarkersOverflow: true,
                rowDecoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: lightColorScheme.outline.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),
                  color: lightColorScheme.surface,
                  shape: BoxShape.rectangle,
                ),
              ),
              headerVisible: false,
              // locale: 'ko-KR',
              daysOfWeekHeight: 56,
              pageAnimationDuration: const Duration(milliseconds: 600),
               rowHeight: 80,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
                _updateRowCount();
              },
            ),
          ],
        ),
      ),
    );
  }
  void _updateRowCount() {
    // 현재 페이지에 표시된 날짜 범위에서 행(주)의 수 계산

    print("_focusedDay.weekday : ${_focusedDay.weekday}");
    DateTime firstVisibleDay = _focusedDay.subtract(Duration(days: _focusedDay.weekday - 1));
    DateTime lastVisibleDay = _focusedDay.add(Duration(days: DateTime.daysPerWeek - _focusedDay.weekday));
    int rowCount = (lastVisibleDay.difference(firstVisibleDay).inDays + 1) ~/ DateTime.daysPerWeek;

    if (_rowCount != rowCount) {
      // 행(주)의 수가 변경되었을 때만 상태 업데이트
      setState(() {
        _rowCount = rowCount;
        print("_rowCount : $_rowCount");
      });
    }
  }
}

