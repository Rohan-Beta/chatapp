// ignore_for_file: prefer_const_constructors

import 'package:chatapp/screens/Auth/auth_screen.dart';
import 'package:get/get.dart';

var screenRoute = [
  GetPage(
    name: "/authScreen",
    page: () => AuthScreen(),
    transition: Transition.rightToLeft,
  ),
];
