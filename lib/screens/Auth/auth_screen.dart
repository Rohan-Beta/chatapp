// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/screens/Auth/auth_widget/auth_body.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // WelcomeHeading(),
              // Container(
              //   width: 100,
              //   height: 80,
              //   child: Lottie.asset(
              //     MyAssetsImage.signin,
              //   ),
              // ),
              // SizedBox(height: 60),
              AuthBody(),
            ],
          ),
        ),
      ),
    );
  }
}
