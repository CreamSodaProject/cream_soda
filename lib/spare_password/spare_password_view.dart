import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'spare_password_provider.dart';

class SparePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SparePasswordProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<SparePasswordProvider>();
    final state = provider.state;

    return Container();
  }
}