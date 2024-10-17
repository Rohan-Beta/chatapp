// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/controller/contact_controller.dart';
import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/screens/group/group_title_screen.dart';
import 'package:chatapp/screens/home/home_widget/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    GroupController groupController = Get.put(GroupController());

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
        onPressed: () {
          if (groupController.groupMembers.isEmpty) {
            Get.snackbar("Error", "please select atleast one member");
          } else {
            Get.to(GroupTitleScreen());
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(
              () => Row(
                children: groupController.groupMembers
                    .map(
                      (e) => Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: 70,
                              height: 70,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: e.profileImage ??
                                      "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                groupController.groupMembers.remove(e);
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Contacts on Connectify",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
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
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            groupController
                                .selectMembers(snapshot.data![index]);
                          },
                          child: ChatTileWidget(
                            imageUrl: snapshot.data![index].profileImage ??
                                "https://cdn-icons-png.flaticon.com/512/9815/9815472.png",
                            name: snapshot.data![index].name!,
                            lastChat: snapshot.data![index].about ?? "",
                            lastChatTime: "",
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
