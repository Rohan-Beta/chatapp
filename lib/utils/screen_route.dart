// ignore_for_file: prefer_const_constructors

import 'package:chatapp/screens/Auth/auth_screen.dart';
import 'package:chatapp/screens/home/home_screen.dart';
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
    transition: Transition.upToDown,
  ),
  // GetPage(
  //   name: "/groupScreen",
  //   page: () => GroupScreen(),
  //   transition: Transition.rightToLeft,
  // ),
  // GetPage(
  //   name: "/callScreen",
  //   page: () => CallScreen(),
  //   transition: Transition.rightToLeft,
  // ),
];
