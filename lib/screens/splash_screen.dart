import 'package:chatapp/controller/splash_controller.dart';
import 'package:chatapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            MyAssetsImage.appIcons,
          ),
        ),
      ),
    );
  }
}
