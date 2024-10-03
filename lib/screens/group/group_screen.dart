// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ChatTileWidget(
              imageUrl:
                  "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
              name: "Study Group",
              lastChat: "LastMessage",
              lastChatTime: "lastChatTime",
            ),
          ],
        ),
      ),
    );
  }
}
