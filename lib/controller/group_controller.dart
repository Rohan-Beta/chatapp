// ignore_for_file: prefer_const_constructors

import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/group_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/screens/home/home_screen.dart';
import 'package:chatapp/utils/toast_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var uid = Uuid();

  ProfileController profileController = Get.put(ProfileController());
  RxList<GroupModel> groupList = <GroupModel>[].obs;

  RxBool isLoading = false.obs;
  RxString selectedImagePath = "".obs;

  @override
  void onInit() {
    super.onInit();
    getGroup();
  }

  void selectMembers(UserModel userModel) {
    if (groupMembers.contains(userModel)) {
      groupMembers.remove(userModel);
    } else {
      groupMembers.add(userModel);
    }
  }

  Future<void> createGroup(
      String groupName, String groupInfo, String imagePath) async {
    isLoading.value = true;
    String groupId = uid.v6();

    groupMembers.add(
      UserModel(
        id: auth.currentUser!.uid,
        name: profileController.currentUser.value.name,
        profileImage: profileController.currentUser.value.profileImage,
        email: profileController.currentUser.value.email,
        role: "admin",
      ),
    );

    try {
      String imageUrl = await profileController.uploadFileToFirebase(imagePath);

      await db.collection("groups").doc(groupId).set(
        {
          "id": groupId,
          "name": groupName,
          "description": groupInfo,
          "profileUrl": imageUrl,
          "members": groupMembers.map((e) => e.toJson()).toList(),
          "createdAt": DateTime.now().toString(),
          "createdBy": auth.currentUser!.uid,
          "timeStamp": DateTime.now().toString(),
        },
      );
      getGroup();
      successMessage("Group Created");
      Get.offAll(HomeScreen());

      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGroup() async {
    isLoading.value = true;

    List<GroupModel> tempGroup = [];
    await db.collection("groups").get().then(
          (value) => tempGroup = value.docs
              .map(
                (e) => GroupModel.fromJson(e.data()),
              )
              .toList(),
        );
    groupList.clear();
    groupList.value = tempGroup
        .where(
          (e) => e.members!.any(
            (element) => element.id == auth.currentUser!.uid,
          ),
        )
        .toList();
    isLoading.value = false;
  }

  Future<void> sendGroupMessage(
      String message, String groupId, String imagePath) async {
    isLoading.value = true;
    var chatId = uid.v6();
    String imageUrl =
        await profileController.uploadFileToFirebase(selectedImagePath.value);

    var newGroupChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl,
      senderId: auth.currentUser!.uid,
      senderName: profileController.currentUser.value.name,
      timeStamp: DateTime.now().toString(),
    );

    await db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .doc(chatId)
        .set(
          newGroupChat.toJson(),
        );
    selectedImagePath.value = "";
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getGroupMessages(String groupId) {
    return db
        .collection("groups")
        .doc(groupId)
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
