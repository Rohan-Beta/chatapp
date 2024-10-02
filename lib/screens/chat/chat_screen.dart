// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/controller/image_picker_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/screens/chat/chat_%20widget/chat_bubble.dart';
import 'package:chatapp/screens/user_profile/user_profile_screen.dart';
import 'package:chatapp/utils/images.dart';
import 'package:chatapp/widgets/screen_helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final UserModel userModel;
  const ChatScreen({super.key, required this.userModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    TextEditingController messageController = TextEditingController();

    RxString message = "".obs;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(
              UserProfileScreen(
                userModel: widget.userModel,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: widget.userModel.profileImage == null ||
                          widget.userModel.profileImage == ""
                      ? "https://cdn-icons-png.flaticon.com/512/9815/9815472.png"
                      : widget.userModel.profileImage!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(
              UserProfileScreen(
                userModel: widget.userModel,
              ),
            );
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userModel.name!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    widget.userModel.status ?? "status",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            left: 10,
            // bottom: 30,
            right:
                // ScreenHeleper.isDesktop(context)
                //     ? MediaQuery.sizeOf(context).width * 0.6
                //     :
                10),
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Container(
                // width: 26,
                // height: 26,
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    message.value = value;
                  },
                  controller: messageController,
                  decoration: InputDecoration(
                    filled: false,
                    hintText: "Type message ....",
                  ),
                ),
              ),
              // image button

              Obx(
                () => chatController.selectedImagePath.value == ""
                    ? InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // chatController.selectedImagePath.value =
                          //     await imagePickerController.pickImage();

                          Get.bottomSheet(
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // gallery button

                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.photo,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  // camera photo

                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.camera,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                          child: SvgPicture.asset(MyAssetsImage.gallery),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          chatController.selectedImagePath.value = "";
                        },
                        icon: Icon(Icons.close),
                      ),

                // SizedBox(),
              ),
              SizedBox(width: 10),
              Obx(
                () => message.value != "" ||
                        chatController.selectedImagePath.value != ""
                    // send button
                    ? InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (messageController.text.isNotEmpty &&
                                  messageController.text != " " ||
                              chatController
                                  .selectedImagePath.value.isNotEmpty) {
                            chatController.sendMessage(
                              widget.userModel.id!,
                              messageController.text,
                              widget.userModel,
                            );
                            messageController.clear();
                            message.value = "";
                          }
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                          child: chatController.isLoading.value
                              ? CircularProgressIndicator()
                              : SvgPicture.asset(MyAssetsImage.send),
                        ),
                      )
                    // mic button

                    : InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          width: 26,
                          height: 26,
                          child: SvgPicture.asset(MyAssetsImage.mic),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 40, left: 10, right: 10),
          child: Container(
            decoration: ScreenHeleper.isDesktop(context)
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                  )
                : BoxDecoration(),
            width:
                // ScreenHeleper.isDesktop(context)
                //     ? MediaQuery.sizeOf(context).width * 0.6
                //     :
                MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      StreamBuilder<List<ChatModel>>(
                        stream:
                            chatController.getMessages(widget.userModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              // child: CircularProgressIndicator(),
                              child: Text(""),
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "Error ${snapshot.error}",
                              ),
                            );
                          }
                          if (snapshot.data == null) {
                            return Center(
                              child: Text("No Messages"),
                            );
                          } else {
                            return ListView.builder(
                              reverse: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                DateTime timeStamp = DateTime.parse(
                                    snapshot.data![index].timeStamp!);

                                String formattedTime =
                                    DateFormat('hh:mm a').format(timeStamp);

                                return ChatBubble(
                                  message: snapshot.data![index].message!,
                                  isComming: snapshot.data![index].senderId !=
                                      profileController.currentUser.value.id,
                                  time: formattedTime,
                                  status: "read",
                                  imageUrl:
                                      snapshot.data![index].imageUrl ?? "",
                                );
                              },
                            );
                          }
                        },
                      ),
                      Obx(
                        () => chatController.selectedImagePath.value != ""
                            ? Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              File(chatController
                                                  .selectedImagePath.value),
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        height: 500,
                                      ),
                                      // Positioned(
                                      //   right: 0,
                                      //   child: IconButton(
                                      //     onPressed: () {
                                      //       chatController
                                      //           .selectedImagePath.value = "";
                                      //     },
                                      //     icon: Icon(Icons.close),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
