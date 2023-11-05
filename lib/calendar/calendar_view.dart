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
    final provider = context.read<CalendarProvider>();
    final state = provider.state;

    return Container();
  }
}