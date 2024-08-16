// ignore_for_file: avoid_print

import 'package:chatapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  // user login

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed("/homeScreen");
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "wrong-password") {
        print("wrong password provided for that user");
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  // user signin

  Future<void> signin(String email, String password, String name) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email, name);
      Get.offAllNamed("/homeScreen");
      print("account created");
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        print("the account already exists for the email");
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  // user logout

  Future<void> logout() async {
    await auth.signOut();
    Get.offAllNamed("/authScreen");
  }

  Future<void> initUser(String email, String name) async {
    var newUser = UserModel(
      id: auth.currentUser!.uid,
      name: name,
      email: email,
    );

    try {
      await db.collection("users").doc(auth.currentUser!.uid).set(
            newUser.toJson(),
          );
    } catch (e) {
      print(e);
    }
  }
}
