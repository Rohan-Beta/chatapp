// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/controller/auth_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/screens/profile/profile_widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfileScreen");
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        title: Text("Profile"),
        leading: IconButton(
          onPressed: () {
            Get.toNamed("/homeScreen");
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              UserInfoWidget(),
              // Spacer(),
              // ElevatedButton(
              //   onPressed: () {
              //     authController.logout();
              //   },
              //   child: Text("Logout"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
