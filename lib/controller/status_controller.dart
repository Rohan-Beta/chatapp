import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusController extends GetxController with WidgetsBindingObserver {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // super.didChangeAppLifecycleState(state);

    print("AppLifecycleState: $state");

    if (state == AppLifecycleState.resumed) {
      await db.collection("users").doc(auth.currentUser!.uid).update(
        {"Status": "Online"},
      );
      print("online");
    } else if (state == AppLifecycleState.paused) {
      await db.collection("users").doc(auth.currentUser!.uid).update(
        {"Status": "Offline"},
      );
      print("offline");
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
