import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<LoginProvider>();
    final state = provider.state;

    return Container();
  }
}