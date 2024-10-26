// ignore_for_file: annotate_overrides, avoid_print

import 'dart:io';

import 'package:chatapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel().obs;

  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
          (value) => {
            currentUser.value = UserModel.fromJson(
              value.data()!,
            ),
          },
        );
  }

  Future<void> updateProfile(
    String imageUrl,
    String name,
    String about,
    String number,
    String email,
    String uid,
  ) async {
    isLoading.value = true;

    try {
      final imageLink = await uploadFileToFirebase(imageUrl);

      final updateUser = UserModel(
          name: name,
          about: about,
          profileImage:
              imageLink == "" ? currentUser.value.profileImage : imageLink,
          phoneNumber: number,
          email: email,
          id: uid);

      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(updateUser.toJson());

      await getUserDetails();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/$imagePath";
    final file = File(imagePath);

    if (imagePath != "") {
      try {
        final ref = storage.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() => {});
        final downloadImageUrl = uploadTask.ref.getDownloadURL();
        // print(downloadImageUrl);
        return downloadImageUrl;
      } catch (e) {
        print(e);
        return "";
      }
    }
    return "";
  }
}
