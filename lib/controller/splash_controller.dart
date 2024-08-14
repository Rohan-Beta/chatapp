// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splashHandle();
  }

  Future<void> splashHandle() async {
    Future.delayed(
      Duration(seconds: 2),
    );
    if (auth.currentUser == null) {
      Get.offAllNamed("/authScreen");
    } else {
      Get.offAllNamed("/homeScreen");
      print(auth.currentUser!.email);
    }
  }
}
