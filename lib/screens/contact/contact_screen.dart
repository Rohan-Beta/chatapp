// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/controller/contact_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/screens/chat/chat_screen.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:chatapp/widgets/new_contact_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  RxBool isSearchEnable = false.obs;

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());

    ProfileController profileController = Get.put(ProfileController());

    ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Select Contact"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon:
                  isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // search bar

              Obx(
                () => isSearchEnable.value
                    ? CupertinoSearchTextField(
                        onSubmitted: (value) => {},
                        style: TextStyle(color: Colors.white),
                        controller: _textEditingController,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.13),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.05),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              ),

              // listview part

              SizedBox(height: 10),
              NewContactTile(
                btnName: 'New Contact',
                icon: Icons.person_add_alt_1,
                onTap: () {},
              ),
              SizedBox(height: 10),
              NewContactTile(
                btnName: 'New Group',
                icon: Icons.group_add,
                onTap: () {},
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Contacts on Connectify"),
                ],
              ),
              Obx(
                () => Column(
                  children: contactController.userList
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Get.to(ChatScreen(userModel: e));
                            // String roomId = chatController.getRoomId(e.id!);
                            // print(roomId);
                          },
                          child: ChatTileWidget(
                            imageUrl: e.profileImage == "" ||
                                    e.profileImage == null
                                ? "https://cdn-icons-png.flaticon.com/512/9815/9815472.png"
                                : e.profileImage!,
                            name: e.email ==
                                    profileController.currentUser.value.email
                                ? "${e.name!} (You)"
                                : e.name!,
                            lastChat: e.about == "" || e.about == null
                                ? "Hey there"
                                : e.about!,
                            lastChatTime: e.email ==
                                    profileController.currentUser.value.email
                                ? ""
                                : "",
                          ),
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
