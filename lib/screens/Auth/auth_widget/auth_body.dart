// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:chatapp/screens/Auth/auth_widget/login_form.dart';
import 'package:chatapp/screens/Auth/auth_widget/signup_form.dart';
import 'package:chatapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLoging = true.obs;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Obx(
            () => isLoging.value
                ? Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    child: Lottie.asset(
                      MyAssetsImage.login,
                    ),
                  )
                : Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    child: Lottie.asset(
                      MyAssetsImage.signin,
                    ),
                  ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 410,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                isLoging.value = true;
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                child: Column(
                                  children: [
                                    Text(
                                      "Log-in",
                                      style: isLoging.value
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                          : Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                    ),
                                    SizedBox(height: 5),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: isLoging.value ? 100 : 0,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                isLoging.value = false;
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                child: Column(
                                  children: [
                                    Text(
                                      "Sing-up",
                                      style: isLoging.value
                                          ? Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                    ),
                                    SizedBox(height: 5),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: isLoging.value ? 0 : 100,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => isLoging.value ? LoginForm() : SignUpForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
