
import 'package:cream_soda/join/join_view.dart';
import 'package:cream_soda/join_auth/join_auth_view.dart';
import 'package:cream_soda/main/main_view.dart';
import 'package:cream_soda/profile/profile_view.dart';
import 'package:flutter/material.dart';

class Move {
  static String mainPage = "/main";
  static String joinPage = "/join";
  static String joinAuthPage = "/joinAuth";
  static String profilePage = "/profile";
}

Map<String, Widget Function(BuildContext)> getRouters(){
  return {
    Move.mainPage: (context) => MainPage(),
    Move.joinPage: (context) => JoinPage(),
    Move.joinAuthPage: (context) => JoinAuthPage(),
    Move.profilePage: (context) => ProfilePage(),

  };
}