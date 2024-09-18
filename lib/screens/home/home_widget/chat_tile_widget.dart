// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatTileWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastChatTime;
  const ChatTileWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastChat,
    required this.lastChatTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: Theme.of(context).colorScheme.primaryContainer,
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      imageUrl,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 5),
                    Text(
                      lastChat,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )
              ],
            ),
            Text(
              lastChatTime,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
