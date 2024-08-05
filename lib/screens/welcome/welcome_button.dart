// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:chatapp/utils/images.dart';
import 'package:chatapp/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: SlideAction(
            onSubmit: () {
              Get.offAllNamed("/authScreen");
            },
            // sliderRotate: false,
            sliderButtonIcon: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                MyAssetsImage.plugSVG,
                width: 25,
              ),
            ),
            submittedIcon: SvgPicture.asset(
              MyAssetsImage.connectSVG,
              width: 25,
            ),
            innerColor: Theme.of(context).colorScheme.primary,
            outerColor: Theme.of(context).colorScheme.primaryContainer,
            text: WelcomeScreenText.slideToStart,
            textStyle: Theme.of(context).textTheme.labelLarge,
            // animationDuration: Duration(seconds: 1),
          ),
        ),
      ],
    );
  }
}
