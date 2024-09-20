// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/chat_room_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;
  var uuid = Uuid();

  ProfileController profileController = Get.put(ProfileController());

  String getRoomId(String targetUserId) {
    String currUserId = auth.currentUser!.uid;

    if (currUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currUserId + targetUserId;
    }
    return targetUserId + currUserId;
  }

  Future<void> sendMessage(
    String targetUserId,
    String message,
    UserModel targetUser,
  ) async {
    isLoading.value = true;
    String chatId = uuid.v6();

    String roomId = getRoomId(targetUserId);
    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: profileController.currentUser.value.name,
      timeStamp: DateTime.now().toString(),
    );
    var roomdDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimeStamp: DateTime.now().toString(),
      sender: profileController.currentUser.value,
      receiver: targetUser,
      timeStamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );

    try {
      await db.collection("chats").doc(roomId).set(
            roomdDetails.toJson(),
          );
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomId(targetUserId);

    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ChatModel.fromJson(doc.data()),
              )
              .toList(),
        );
  }
}
