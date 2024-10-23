// ignore_for_file: prefer_const_constructors

import 'package:chatapp/model/audio_call_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uid = Uuid().v4();

  void onInit() {
    super.onInit();

    getCallNotification().listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          Get.snackbar("Calling", "Calling");
        }
      },
    );
  }

  Future<void> callAction(UserModel receiver, UserModel caller) async {
    String id = uid;
    var newCall = AudioCallModel(
      id: id,
      callerName: caller.name,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      callerEmail: caller.email,
      receiverName: receiver.name,
      receiverPic: receiver.profileImage,
      receiverUid: receiver.id,
      receiverEmail: receiver.email,
      status: "dialing",
    );
    try {
      await db
          .collection("notification")
          .doc(receiver.id)
          .collection("call")
          .doc(id)
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());

      Future.delayed(
        Duration(minutes: 1),
        () {
          endcall(newCall);
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> getCallNotification() {
    return db
        .collection("notification")
        .doc(auth.currentUser!.uid)
        .collection("calls")
        .snapshots();
  }

  Future<void> endcall(AudioCallModel call) async {
    try {
      await db
          .collection("notification")
          .doc(call.receiverUid)
          .collection("call")
          .doc(call.id)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
