// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupTitleScreen extends StatefulWidget {
  const GroupTitleScreen({super.key});

  @override
  State<GroupTitleScreen> createState() => _GroupTitleScreenState();
}

class _GroupTitleScreenState extends State<GroupTitleScreen> {
  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("New Group"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {},
        child: Icon(
          Icons.done,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Group Name",
                            prefix: Icon(Icons.group),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Group Description",
                            prefix: Icon(Icons.info),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: groupController.groupMembers
                      .map(
                        (e) => ChatTileWidget(
                          imageUrl: e.profileImage ??
                              "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                          name: e.name!,
                          lastChat: e.about == null || e.about == ""
                              ? "Hey there!"
                              : e.about!,
                          lastChatTime: "",
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
