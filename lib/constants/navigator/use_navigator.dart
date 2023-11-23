import 'package:cream_soda/calendar/calendar_view.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class UseNavigator extends StatefulWidget {
  const UseNavigator({super.key});

  @override
  State<UseNavigator> createState() => _UseNavigatorState();
}

class _UseNavigatorState extends State<UseNavigator> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO : 수정해야 함~
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: NavigationBar(
          surfaceTintColor: lightColorScheme.onPrimary,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          elevation: 0,
          animationDuration: const Duration(milliseconds: 100),
          indicatorColor: lightColorScheme.background,
          selectedIndex: currentPageIndex,
          destinations:  <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.calendar_month, color: lightColorScheme.primary,size: 25),
              icon: Icon(Icons.calendar_month, color: lightColorScheme.outline, size: 25),
              label: '일정',
            ),
            NavigationDestination(
              selectedIcon: Image.asset("assets/images/memo.png", width: 25, height: 25, color: lightColorScheme.primary),
              icon: Image.asset("assets/images/memo.png", width: 25, height: 25, color: lightColorScheme.outline),
              label: '메모',
            ),
            NavigationDestination(
              selectedIcon: Image.asset("assets/images/add.png", width: 25, height: 25, color: lightColorScheme.primary),
              icon: Image.asset("assets/images/add.png", width: 25, height: 25, color: lightColorScheme.outline),
              label: '작성',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications, color: lightColorScheme.primary,size: 25),
              icon: Icon(Icons.notifications, color: lightColorScheme.outline,size: 25),
              label: '알림',
            ),
            NavigationDestination(
              selectedIcon: Image.asset("assets/images/setting.png", width: 25, height: 25, color: lightColorScheme.primary),
              icon:  Image.asset("assets/images/setting.png", width: 25, height: 25, color: lightColorScheme.outline),
              label: '설정',
            ),
          ]),
      body: <Widget>[
        CalendarPage(),
        const Text("test2"),
        const Text("test3"),
        const Text("test4"),
        const Text("test5"),
      ][currentPageIndex],
    ));
  }
}
