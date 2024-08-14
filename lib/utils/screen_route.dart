// ignore_for_file: prefer_const_constructors

import 'package:chatapp/screens/Auth/auth_screen.dart';
import 'package:chatapp/screens/chat/chat_screen.dart';
import 'package:chatapp/screens/home/home_screen.dart';
import 'package:chatapp/screens/profile/profile_screen.dart';
import 'package:get/get.dart';

var screenRoute = [
  GetPage(
    name: "/authScreen",
    page: () => AuthScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/homeScreen",
    page: () => HomeScreen(),
    // transition: Transition.upToDown,
    transition: Transition.downToUp,
  ),
  GetPage(
    name: "/chatScreen",
    page: () => ChatScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/profileScreen",
    page: () => ProfileScreen(),
    transition: Transition.upToDown,
  ),
];
