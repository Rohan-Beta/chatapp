// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks

import 'package:chatapp/controller/contact_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/screens/chat/chat_screen.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 8),
              child: CupertinoSearchTextField(
                onTap: () {
                  contactController.getChatRoomList();
                },
                // onSubmitted: (value) => {
                //   contactController.getUserList(),
                // },
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
              ),
            ),
          ),
          // InkWell(
          //   onTap:
          //       // ScreenHeleper.isDesktop(context)
          //       //     ? () {
          //       //         GlassBox(
          //       //           customChild: ChatScreen(),
          //       //         );
          //       //       }
          //       // :
          //       () {
          //     Get.toNamed("/chatScreen");
          //   },
          //   child: ChatTileWidget(
          //     imageUrl: "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
          //     name: "Unknown",
          //     lastChat: "last chat",
          //     lastChatTime: "time",
          //   ),
          // ),

          RefreshIndicator(
            onRefresh: () {
              return contactController.getChatRoomList();
            },
            child: Obx(
              () => ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: contactController.chatRoomList
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Get.to(ChatScreen(userModel: e.receiver!));
                        },
                        child: ChatTileWidget(
                          imageUrl: e.receiver!.profileImage ??
                              "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                          name: e.receiver!.name ==
                                  profileController.currentUser.value.name
                              ? "You"
                              : e.receiver!.name!,
                          lastChat: e.lastMessage!,
                          lastChatTime: e.receiver!.email ==
                                  profileController.currentUser.value.email
                              ? ""
                              : e.lastMessageTimeStamp!,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
