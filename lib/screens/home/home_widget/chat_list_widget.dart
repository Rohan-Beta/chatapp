// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:chatapp/utils/images.dart';
import 'package:chatapp/widgets/screen_helper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 8),
            child: CupertinoSearchTextField(
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
        InkWell(
          onTap: () {
            Get.toNamed("/chatScreen");
          },
          child: ChatTileWidget(
            imageUrl: MyAssetsImage.girlPic,
            name: "Unknown",
            lastChat: "last chat",
            lastChatTime: "time",
          ),
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        ChatTileWidget(
          imageUrl: MyAssetsImage.girlPic,
          name: "Unknown",
          lastChat: "last chat",
          lastChatTime: "time",
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
