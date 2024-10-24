// ignore_for_file: prefer_const_constructors

import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallScreen extends StatefulWidget {
  final UserModel target;
  const AudioCallScreen({super.key, required this.target});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());

    var callId = chatController.getRoomId(widget.target.id!);

    return ZegoUIKitPrebuiltCall(
      appID: 1281382047,
      appSign:
          "228605e7f7fee2201a0fbeb04173026d6e862ed1516e8448fc8e931e98327a4d",
      callID: callId,
      userID: profileController.currentUser.value.id!,
      userName: profileController.currentUser.value.name!,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}