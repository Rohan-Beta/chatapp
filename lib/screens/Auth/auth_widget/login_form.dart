// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        SizedBox(height: 40),
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
        const SizedBox(height: 20),
        Row(
          children: [
            InkWell(
              onTap: () {
                // Get.to(ForgotPassword());
              },
              child: Text(
                "Forgot Password ? ",
                style: TextStyle(fontSize: 14, color: Colors.purple),
              ),
            ),
          ],
        ),
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              onTap: () {
                Get.offAllNamed("/homeScreen");
              },
              buttonName: "LOGIN",
              icon: Icons.lock_open_sharp,
            ),
          ],
        ),
        // Obx(() => authContr)
      ],
    );
  }
}
