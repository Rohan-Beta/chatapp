// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/screens/profile/profile_widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
