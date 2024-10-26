// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:chatapp/model/call_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/screens/call/audio_call_screen.dart';
import 'package:chatapp/screens/call/video_call_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uid = Uuid().v4();

  @override
  void onInit() {
    super.onInit();

    getCallNotification().listen(
      (List<CallModel> callList) {
        var callData = callList[0];

        if (callData.type == "audio") {
          audioCallNotification(callData);
        } else if (callData.type == "video") {
          videoCallNotification(callData);
        }
      },
    );
  }

  Future<void> audioCallNotification(CallModel callData) async {
    Get.snackbar(
      duration: Duration(days: 1),
      barBlur: 0,
      isDismissible: false,
      backgroundColor: Colors.grey[900]!,
      icon: Icon(Icons.call),
      onTap: (snack) {
        Get.back();
        // Get.to(
        // AudioCallScreen(
        //   target: UserModel(
        //     id: callData.callerUid,
        //     name: callData.callerName,
        //     email: callData.callerEmail,
        //     profileImage: callData.callerPic,
        //   ),
        // ),
        // );
      },
      callData.callerName!,
      "Incoming audio call",
      mainButton: TextButton(
        onPressed: () {
          endcall(callData);
          Get.back();
        },
        child: Text("End call"),
      ),
    );
  }

  Future<void> callAction(
      UserModel receiver, UserModel caller, String type) async {
    String id = uid;
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);
    var newCall = CallModel(
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
      type: type,
      time: nowTime,
      timeStamp: timestamp.toString(),
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

  Stream<List<CallModel>> getCallNotification() {
    return db
        .collection("notification")
        .doc(auth.currentUser!.uid)
        .collection("call")
        .snapshots()
        .map((snashot) =>
            snashot.docs.map((doc) => CallModel.fromJson(doc.data())).toList());
  }

  Future<void> endcall(CallModel call) async {
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

  void videoCallNotification(CallModel callData) {
    Get.snackbar(
      duration: Duration(days: 1),
      barBlur: 0,
      isDismissible: false,
      backgroundColor: Colors.grey[900]!,
      icon: Icon(Icons.videocam),
      onTap: (snack) {
        Get.back();
        // Get.to(
        //   VideoCallScreen(
        //     target: UserModel(
        //       id: callData.callerUid,
        //       name: callData.callerName,
        //       email: callData.callerEmail,
        //       profileImage: callData.callerPic,
        //     ),
        //   ),
        // );
      },
      callData.callerName!,
      "Incoming video call",
      mainButton: TextButton(
        onPressed: () {
          endcall(callData);
          Get.back();
        },
        child: Text("End call"),
      ),
    );
  }
}
