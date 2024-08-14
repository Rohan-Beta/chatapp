// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:chatapp/screens/chat/chat_%20widget/chat_bubble.dart';
import 'package:chatapp/utils/images.dart';
import 'package:chatapp/widgets/screen_helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(MyAssetsImage.boyPic),
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "status",
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
              Container(
                width: 26,
                height: 26,
                child: SvgPicture.asset(MyAssetsImage.send),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
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
            child: ListView(
              children: [
                SizedBox(height: 20),
                ChatBubble(
                  message: "Hello world! nice to meet you",
                  isComming: true,
                  time: "10:10 AM",
                  status: "read",
                  imageUrl: '',
                ),
                ChatBubble(
                  message: "Hello world! nice to meet you",
                  isComming: false,
                  time: "10:10 AM",
                  status: "read",
                  imageUrl: '',
                ),
                ChatBubble(
                  message: "Hello world! nice to meet you",
                  isComming: false,
                  time: "10:10 AM",
                  status: "read",
                  imageUrl:
                      'https://cdn.prod.website-files.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png',
                ),
                ChatBubble(
                  message:
                      "Hello world! nice to meet youkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                  isComming: true,
                  time: "10:10 AM",
                  status: "read",
                  imageUrl: '',
                ),
                ChatBubble(
                  message: "Hello world! nice to meet you",
                  isComming: true,
                  time: "10:10 AM",
                  status: "read",
                  imageUrl:
                      'https://cdn.prod.website-files.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png',
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
