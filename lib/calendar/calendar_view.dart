import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/create_calendar/components/calendar_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 40,
                      height: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/defaultCalendar.png",
                          fit: BoxFit.fill,
                        ),
                      )),
                  SizedBox(width: gap10),
                  Text(
                    "캘린더이름",
                    style: TextStyle(fontSize: font12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                  DateTime.now().year.toString() +
                      "년 " +
                      DateTime.now().month.toString() +
                      "월",
                  style:
                      TextStyle(fontSize: font12, fontWeight: FontWeight.w600)),
            ],
          ),
          Table(
            children: [

            ],
          )
        ],
      ),
    ));
  }
}
