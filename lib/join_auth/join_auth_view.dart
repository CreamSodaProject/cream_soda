import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'join_auth_provider.dart';

class JoinAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => JoinAuthProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<JoinAuthProvider>();
    final state = provider.state;

    return Container(
      child: Text("JoinAuthPage", style: TextStyle(color: Colors.white)),
    );
  }
}