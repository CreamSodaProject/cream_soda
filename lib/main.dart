
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'CreamSoda',
      // initialRoute: Move.mainPage,
          initialRoute: Move.navigatorPage,
      routes: getRouters(),
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      )
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
