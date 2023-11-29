import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/material.dart';

class CalendarTitle extends StatelessWidget {
  const CalendarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: TextStyle(
                  fontSize: font12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Text(
            DateTime.now().year.toString() +
                "년 " +
                DateTime.now().month.toString() +
                "월",
            style: TextStyle(
                fontSize: font12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
