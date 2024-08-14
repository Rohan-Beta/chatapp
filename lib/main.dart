// ignore_for_file: prefer_const_constructors

import 'package:chatapp/screens/Auth/auth_screen.dart';
import 'package:chatapp/utils/Themes.dart';
import 'package:chatapp/utils/screen_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCTA053-ymMKfTE1IgXncCnZOdl7r47k8w",
          authDomain: "chatapp-7c4dd.firebaseapp.com",
          projectId: "chatapp-7c4dd",
          storageBucket: "chatapp-7c4dd.appspot.com",
          messagingSenderId: "903847094731",
          appId: "1:903847094731:web:7980b37b692c2c9af32e4e",
          measurementId: "G-JBX7SFQN08"),
    );
  } else {
    await Firebase.initializeApp();
  }

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
      home: AuthScreen(),
      // home: SplashScreen(),
      getPages: screenRoute,
    );
  }
}
