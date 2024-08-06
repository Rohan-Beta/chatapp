// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:chatapp/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CupertinoSearchTextField(
            controller: _textEditingController,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(30),
            ),
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