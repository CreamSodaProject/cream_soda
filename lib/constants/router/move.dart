
import 'package:cream_soda/constants/navigator/use_navigator.dart';
import 'package:cream_soda/view/create_calendar/create_calendar_view.dart';
import 'package:cream_soda/view/join/join_view.dart';
import 'package:cream_soda/view/join_auth/join_auth_view.dart';
import 'package:cream_soda/view/login/login_view.dart';
import 'package:cream_soda/view/main/main_view.dart';
import 'package:cream_soda/view/profile/profile_view.dart';
import 'package:cream_soda/view/spare_password/spare_password_view.dart';
import 'package:flutter/material.dart';

class Move {
  static String mainPage = "/main";
  static String joinPage = "/join";
  static String joinAuthPage = "/joinAuth";
  static String profilePage = "/profile";
  static String loginPage = "/login";
  static String createCalendarPage = "/createCalendar";
  static String sparePasswordPage = "/sparePassword";
  static String navigatorPage = "/navigator";
  static String calendarPage = "/calendar";
  static String test = "/test";


}

Map<String, Widget Function(BuildContext)> getRouters(){
  return {
    Move.mainPage: (context) => MainPage(),
    Move.joinPage: (context) => JoinPage(),
    Move.joinAuthPage: (context) => JoinAuthPage(),
    Move.profilePage: (context) => ProfilePage(),
    Move.loginPage: (context) => LoginPage(),
    Move.createCalendarPage: (context) => CreateCalendarPage(),
    Move.sparePasswordPage: (context) => SparePasswordPage(),
    Move.navigatorPage: (context) => UseNavigator()

  };
}