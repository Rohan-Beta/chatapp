// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/utils/colors.dart';
import 'package:chatapp/utils/images.dart';
import 'package:chatapp/widgets/screen_helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isComming,
    required this.time,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: ScreenHeleper.isDesktop(context)
                    ? MediaQuery.sizeOf(context).width * 0.3
                    : MediaQuery.sizeOf(context).width * 0.64,
              ),
              padding: imageUrl == "" ? EdgeInsets.all(6) : EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isComming == true
                    ? Theme.of(context).colorScheme.primaryContainer
                    : dPrimaryColor,
                border: Border(),
                borderRadius: BorderRadius.only(
                  topLeft: isComming ? Radius.circular(0) : Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight:
                      isComming ? Radius.circular(10) : Radius.circular(0),
                ),
              ),
              child: imageUrl == ""
                  ? Text(message)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrl),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 10),
                          child: Text(message),
                        ),
                      ],
                    ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment:
                  isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                isComming
                    ? Text(
                        time,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    : Row(
                        children: [
                          Text(
                            time,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset(
                            MyAssetsImage.chatStatus,
                            width: 20,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
