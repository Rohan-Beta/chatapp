import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
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

  Future<void> signin(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
}
