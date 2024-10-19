// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'dart:io';

import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/controller/image_picker_controller.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GroupTitleScreen extends StatefulWidget {
  const GroupTitleScreen({super.key});

  @override
  State<GroupTitleScreen> createState() => _GroupTitleScreenState();
}

class _GroupTitleScreenState extends State<GroupTitleScreen> {
  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    RxString imagePath = "".obs;

    RxString groupNameController = "".obs;
    RxString groupInfoController = "".obs;

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
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor:
              groupNameController.isEmpty || groupInfoController.isEmpty
                  ? Colors.grey
                  : Theme.of(context).colorScheme.primary,
          onPressed: () {
            groupNameController.isEmpty || groupInfoController.isEmpty
                ? Get.snackbar("Error", "Please enter group name and about")
                : groupController.createGroup(groupNameController.value,
                    groupInfoController.value, imagePath.value);
          },
          child: groupController.isLoading.value == true
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Icon(
                  Icons.done,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
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
                        Obx(
                          () => InkWell(
                            onTap: () async {
                              imagePath.value = await imagePickerController
                                  .pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: imagePath == ""
                                  ? Icon(Icons.group)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(imagePath.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            groupNameController.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Group Name",
                            prefixIcon: Icon(Icons.group),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onChanged: (value) {
                            groupInfoController.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Group Description",
                            prefixIcon: Icon(Icons.info),
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
