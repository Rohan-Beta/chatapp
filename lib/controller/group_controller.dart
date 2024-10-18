// ignore_for_file: prefer_const_constructors

import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/screens/home/home_screen.dart';
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

  RxBool isLoading = false.obs;

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

      Get.snackbar("Group Created", "Group Created Successfully");
      Get.offAll(HomeScreen());

      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
