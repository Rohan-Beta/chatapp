// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:chatapp/controller/contact_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/chat_room_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;
  var uuid = Uuid();

  ProfileController profileController = Get.put(ProfileController());
  ContactController contactController = Get.put(ContactController());
  RxString selectedImagePath = "".obs;

  String getRoomId(String targetUserId) {
    String currUserId = auth.currentUser!.uid;

    if (currUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currUserId + targetUserId;
    }
    return targetUserId + currUserId;
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;

    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReceiver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;

    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }

  Future<void> sendMessage(
    String targetUserId,
    String message,
    UserModel targetUser,
  ) async {
    isLoading.value = true;
    String chatId = uuid.v6();

    String roomId = getRoomId(targetUserId);
    DateTime timeStamp = DateTime.now();
    String timeNow = DateFormat('hh:mm a').format(timeStamp);

    UserModel sender =
        getSender(profileController.currentUser.value, targetUser);

    UserModel receiver =
        getReceiver(profileController.currentUser.value, targetUser);

    RxString imageUrl = "".obs;

    if (selectedImagePath.value.isNotEmpty) {
      imageUrl.value =
          await profileController.uploadFileToFirebase(selectedImagePath.value);
    }

    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: profileController.currentUser.value.name,
      timeStamp: DateTime.now().toString(),
      imageUrl: imageUrl.value,
    );
    var roomdDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimeStamp: timeNow,
      sender: sender,
      receiver: receiver,
      timeStamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
      selectedImagePath.value = "";

      await db.collection("chats").doc(roomId).set(
            roomdDetails.toJson(),
          );
      await contactController.saveContact(targetUser);
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

  Stream<UserModel> getStatus(String uid) {
    return db.collection("users").doc(uid).snapshots().map(
      (event) {
        return UserModel.fromJson(event.data()!);
      },
    );
  }
}
