// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:chatapp/utils/images.dart';
import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final customChild;
  const GlassBox({
    super.key,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyAssetsImage.background1),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              // gradient effect
              child: Container(),
            ),
            // child
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.13),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            Center(
              child: customChild,
            ),
          ],
        ),
      ),
    );
  }
}
