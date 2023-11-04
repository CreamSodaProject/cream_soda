
import 'package:cream_soda/create_calendar/create_calendar_view.dart';
import 'package:cream_soda/join/join_view.dart';
import 'package:cream_soda/join_auth/join_auth_view.dart';
import 'package:cream_soda/login/login_view.dart';
import 'package:cream_soda/main/main_view.dart';
import 'package:cream_soda/profile/profile_view.dart';
import 'package:cream_soda/spare_password/spare_password_view.dart';
import 'package:flutter/material.dart';

class Move {
  static String mainPage = "/main";
  static String joinPage = "/join";
  static String joinAuthPage = "/joinAuth";
  static String profilePage = "/profile";
  static String loginPage = "/login";
  static String createCalendarPage = "/createCalendar";
  static String sparePasswordPage = "/sparePassword";

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

  };
}