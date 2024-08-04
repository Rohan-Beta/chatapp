// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/screens/welcome/welcome_body.dart';
import 'package:chatapp/screens/welcome/welcome_button.dart';
import 'package:chatapp/screens/welcome/welcome_heading.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 30),
              WelcomeHeading(),
              SizedBox(height: 20),
              WelcomeBody(),
              SizedBox(height: 20),
              WelcomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
