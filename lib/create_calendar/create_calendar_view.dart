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
    final provider = context.read<CreateCalendarProvider>();
    final state = provider.state;

    return Container();
  }
}