// ignore_for_file: prefer_const_constructors

import 'package:chatapp/utils/images.dart';
import 'package:chatapp/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(MyAssetsImage.welcome),
        SizedBox(height: 20),
        Text(
          WelcomeScreenText.nowyYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomeScreenText.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 30),
        Text(
          WelcomeScreenText.description,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
