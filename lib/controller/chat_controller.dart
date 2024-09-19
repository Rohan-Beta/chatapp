import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  String getRoomId(String targetUserId) {
    String currUserId = auth.currentUser!.uid;

    if (currUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currUserId + targetUserId;
    }
    return targetUserId + currUserId;
  }
}
