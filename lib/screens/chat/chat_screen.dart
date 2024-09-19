// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/screens/chat/chat_%20widget/chat_bubble.dart';
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
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(MyAssetsImage.boyPic),
        backgroundColor: Colors.transparent,
        title: Column(
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
            bottom: 5,
            right:
                // ScreenHeleper.isDesktop(context)
                //     ? MediaQuery.sizeOf(context).width * 0.6
                //     :
                10),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Container(
                width: 26,
                height: 26,
                child: SvgPicture.asset(MyAssetsImage.mic),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                      filled: false, hintText: "Type message ...."),
                ),
              ),
              Container(
                width: 26,
                height: 26,
                child: SvgPicture.asset(MyAssetsImage.gallery),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  if (messageController.text.isNotEmpty &&
                      messageController.text != " ") {
                    chatController.sendMessage(
                      widget.userModel.id!,
                      messageController.text,
                    );
                    messageController.clear();
                  }
                },
                child: Container(
                  width: 26,
                  height: 26,
                  child: SvgPicture.asset(MyAssetsImage.send),
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
            child: StreamBuilder<List<ChatModel>>(
              stream: chatController.getMessages(widget.userModel.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
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
                      DateTime timeStamp =
                          DateTime.parse(snapshot.data![index].timeStamp!);

                      String formattedTime =
                          DateFormat('hh:mm a').format(timeStamp);

                      return ChatBubble(
                        message: snapshot.data![index].message!,
                        isComming: snapshot.data![index].senderId !=
                            profileController.currentUser.value.id,
                        time: formattedTime,
                        status: "read",
                        imageUrl: snapshot.data![index].imageUrl ?? "",
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
