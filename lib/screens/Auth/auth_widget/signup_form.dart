// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/controller/auth_controller.dart';
import 'package:chatapp/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        SizedBox(height: 40),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Name",
            prefixIcon: Icon(
              Icons.person_outline_sharp,
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(
              Icons.email_outlined,
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: const InputDecoration(
            hintText: "Passowrd",
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        SizedBox(height: 24),
        Obx(
          () => authController.isLoading.value
              ? CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      onTap: () {
                        authController.signin(
                          email.text,
                          password.text,
                          name.text,
                        );
                      },
                      buttonName: "SIGNUP",
                      icon: Icons.lock_open_sharp,
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
