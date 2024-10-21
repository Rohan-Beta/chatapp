// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:chatapp/controller/auth_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/screens/user_profile/profile_widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel userModel;
  const UserProfileScreen({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
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
            Get.back();
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
              UserInfoWidget(
                profileImage: userModel.profileImage ??
                    "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                userName: userModel.name!,
                userEmail: userModel.about!,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  authController.logout();
                },
                child: Text("Block"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
