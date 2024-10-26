// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_if_null_operators, unnecessary_null_comparison, sized_box_for_whitespace, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupMemberInfoWidget extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  final String groupId;
  const GroupMemberInfoWidget({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    GroupController groupController = Get.put(GroupController());
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // call

                    // Container(
                    //   height: 50,
                    //   padding: EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: Theme.of(context).colorScheme.background,
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SvgPicture.asset(
                    //         MyAssetsImage.call,
                    //         width: 25,
                    //       ),
                    //       SizedBox(width: 10),
                    //       Text(
                    //         "Call",
                    //         style: TextStyle(
                    //           color: Color(0xff039C00),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // video call

                    // Container(
                    //   height: 50,
                    //   padding: EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: Theme.of(context).colorScheme.background,
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SvgPicture.asset(
                    //         MyAssetsImage.videoCall,
                    //         width: 25,
                    //         color: Color(0xffFF9900),
                    //       ),
                    //       SizedBox(width: 10),
                    //       Text(
                    //         "Video",
                    //         style: TextStyle(
                    //           color: Color(0xffFF9900),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // chat

                    // InkWell(
                    //   onTap: () {
                    //     // var newMember = UserModel(
                    //     //   email: userEmail,
                    //     //   name: userName,
                    //     //   profileImage: profileImage,
                    //     // );
                    //     // groupController.addMemberToGroup(groupId, newMember);
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     padding: EdgeInsets.all(15),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: Theme.of(context).colorScheme.background,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         // SvgPicture.asset(
                    //         //   MyAssetsImage.chat,
                    //         //   width: 25,
                    //         //   color: Color(0xff0057FF),
                    //         // ),
                    //         Icon(
                    //           Icons.person_add_alt_1,
                    //           color: Color(0xff0057FF),
                    //         ),
                    //         SizedBox(width: 10),
                    //         Text(
                    //           "Add",
                    //           style: TextStyle(
                    //             color: Color(0xff0057FF),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
