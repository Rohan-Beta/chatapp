// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/screens/group/group_chat_screen.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());

    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Get.to(GroupChatScreen(groupModel: group));
                },
                child: ChatTileWidget(
                  imageUrl: group.profileUrl == ""
                      ? "https://cdn-icons-png.flaticon.com/512/9815/9815472.png"
                      : group.profileUrl!,
                  name: group.name!,
                  lastChat: "Group Created",
                  lastChatTime: "Just Now",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
