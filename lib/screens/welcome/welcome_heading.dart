// ignore_for_file: prefer_const_constructors

import 'package:chatapp/utils/images.dart';
import 'package:chatapp/utils/text.dart';
import 'package:flutter/material.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MyAssetsImage.appIcons,
              // color: Theme.of(context).colorScheme.onBackground,
            ),
          ],
        ),
        Text(
          AppTexts.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
