// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/controller/contact_controller.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: contactController.getContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: Text("No Message"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChatTileWidget(
                    imageUrl: snapshot.data![index].profileImage ??
                        "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                    name: snapshot.data![index].name!,
                    lastChat: snapshot.data![index].about ?? "",
                    lastChatTime: "",
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
