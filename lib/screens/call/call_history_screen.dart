// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({super.key});

  @override
  State<CallHistoryScreen> createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: chatController.getCalls(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  DateTime timeStamp =
                      DateTime.parse(snapshot.data![index].timeStamp!);
                  String formattedTime =
                      DateFormat('hh:mm a').format(timeStamp);
                  return ChatTileWidget(
                    imageUrl: snapshot.data![index].callerPic ??
                        "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                    name: snapshot.data![index].callerName!,
                    lastChat: snapshot.data![index].type!,
                    lastChatTime: formattedTime,
                  );
                },
              );
            } else {
              return Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
