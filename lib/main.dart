// ignore_for_file: prefer_const_constructors

import 'package:chatapp/screens/home/home_screen.dart';
import 'package:chatapp/utils/Themes.dart';
import 'package:chatapp/utils/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connectify',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
      getPages: screenRoute,
    );
  }
}
