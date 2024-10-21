// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers

import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/group_model.dart';
import 'package:chatapp/screens/group/group_members_info_screen.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupInfoScreen extends StatelessWidget {
  final GroupModel groupModel;
  const GroupInfoScreen({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    GroupController groupController = Get.put(GroupController());

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
        title: Text("Group Info"),
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
          child: ListView(
            children: [
              GroupMemberInfoWidget(
                profileImage: groupModel.profileUrl == ""
                    ? "https://cdn-icons-png.flaticon.com/512/9815/9815472.png"
                    : groupModel.profileUrl!,
                userName: groupModel.name!,
                userEmail: groupModel.description!,
                groupId: groupModel.id!,
              ),
              SizedBox(height: 20),
              Text(
                "Members",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: groupModel.members!
                      .map(
                        (members) => ChatTileWidget(
                          imageUrl: members.profileImage! == ""
                              ? "https://cdn-icons-png.flaticon.com/512/9815/9815472.png"
                              : members.profileImage!,
                          name: members.name!,
                          lastChat: members.email!,
                          lastChatTime:
                              members.role == "admin" ? "Admin" : "Members",
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
