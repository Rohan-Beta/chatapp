// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:chatapp/controller/image_picker_controller.dart';
import 'package:chatapp/controller/profile_controller.dart';
import 'package:chatapp/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());

    TextEditingController nameController =
        TextEditingController(text: profileController.currentUser.value.name);

    TextEditingController emailController =
        TextEditingController(text: profileController.currentUser.value.email);

    TextEditingController phoneController = TextEditingController(
        text: profileController.currentUser.value.phoneNumber);

    TextEditingController aboutController =
        TextEditingController(text: profileController.currentUser.value.about);

    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    RxString imagePath = "".obs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Profile"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                // height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => isEdit.value
                                    ? InkWell(
                                        onTap: () async {
                                          imagePath.value =
                                              await imagePickerController
                                                  .pickImage();
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: imagePath.value == ""
                                              ? Icon(Icons.add)
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.file(
                                                    File(imagePath.value),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                      )
                                    : Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: profileController.currentUser
                                                    .value.profileImage ==
                                                ""
                                            ? Icon(Icons.image)
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.network(
                                                  profileController.currentUser
                                                      .value.profileImage!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => TextField(
                              controller: nameController,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                filled: isEdit.value,
                                prefixIcon: Icon(Icons.person),
                                labelText: "Name",
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => TextField(
                              controller: aboutController,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                filled: isEdit.value,
                                prefixIcon: Icon(Icons.info),
                                labelText: "About",
                              ),
                            ),
                          ),
                          TextField(
                            controller: emailController,
                            enabled: false,
                            decoration: InputDecoration(
                              filled: false,
                              prefixIcon: Icon(Icons.alternate_email),
                              labelText: "Email",
                            ),
                          ),
                          TextField(
                            controller: phoneController,
                            enabled: false,
                            decoration: InputDecoration(
                              filled: false,
                              prefixIcon: Icon(Icons.phone),
                              labelText: "Phone",
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => isEdit.value
                                    ? PrimaryButton(
                                        buttonName: "Save",
                                        icon: Icons.save,
                                        onTap: () async {
                                          await profileController.updateProfile(
                                            imagePath.value,
                                            nameController.text,
                                            aboutController.text,
                                            phoneController.text,
                                          );
                                          isEdit.value = false;
                                        },
                                      )
                                    : PrimaryButton(
                                        buttonName: "Edit",
                                        icon: Icons.edit,
                                        onTap: () {
                                          isEdit.value = true;
                                        },
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
