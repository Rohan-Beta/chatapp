// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:chatapp/utils/colors.dart';
import 'package:chatapp/widgets/bottom_nav_bar_widget.dart';
import 'package:chatapp/widgets/clipper_widget.dart';
import 'package:chatapp/widgets/screen_helper_widget.dart';
import 'package:flutter/material.dart';

class BottomNaviagtion extends StatefulWidget {
  const BottomNaviagtion({super.key});

  @override
  State<BottomNaviagtion> createState() => _BottomNaviagtionState();
}

class _BottomNaviagtionState extends State<BottomNaviagtion> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: ScreenHeleper.isDesktop(context)
            ? (MediaQuery.sizeOf(context).width / 100) * 4
            : ScreenHeleper.isTablet(context)
                ? (MediaQuery.sizeOf(context).width / 100) * 5
                : (MediaQuery.sizeOf(context).width / 100) * 12,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            // list of bottom with icons
            Positioned(
              bottom: 0,
              top: 0,
              left: (MediaQuery.sizeOf(context).width / 100) * 3,
              right: (MediaQuery.sizeOf(context).width / 100) * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomNavBarWidget(
                    icon: Icons.chat_outlined,
                    index: 0,
                    currentIndex: _currentIndex,
                    onPressed: (val) {
                      // Get.offAllNamed("/homeScreen");
                      setState(
                        () {
                          _currentIndex = val;
                        },
                      );
                    },
                  ),
                  BottomNavBarWidget(
                    icon: Icons.groups_2_outlined,
                    index: 1,
                    currentIndex: _currentIndex,
                    onPressed: (val) {
                      // Get.offAllNamed("/groupScreen");
                      setState(
                        () {
                          _currentIndex = val;
                        },
                      );
                    },
                  ),
                  BottomNavBarWidget(
                    icon: Icons.call_outlined,
                    index: 2,
                    currentIndex: _currentIndex,
                    onPressed: (val) {
                      // Get.offAllNamed("/callScreen");
                      setState(
                        () {
                          _currentIndex = val;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            // animated indicator for selected items
            ScreenHeleper.isMobile(context)
                ? AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                    left: _currentIndex == 0
                        ? (MediaQuery.sizeOf(context).width) * 0.123
                        : _currentIndex == 1
                            ? (MediaQuery.sizeOf(context).width) * 0.43
                            : (MediaQuery.sizeOf(context).width) * 0.734,
                    child: Column(
                      children: [
                        Container(
                          height:
                              (MediaQuery.sizeOf(context).width / 100) * 1.0,
                          width: (MediaQuery.sizeOf(context).width / 100) * 12,
                          decoration: BoxDecoration(
                            color: dPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        ClipPath(
                          clipper: MyCustomClipper(
                            blockSizeHorizontal:
                                MediaQuery.sizeOf(context).width / 100,
                          ),
                          child: Container(
                            height:
                                (MediaQuery.sizeOf(context).width / 100) * 15,
                            width:
                                (MediaQuery.sizeOf(context).width / 100) * 12,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  dPrimaryColor.withOpacity(0.8),
                                  dPrimaryColor.withOpacity(0.5),
                                  Colors.transparent,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
