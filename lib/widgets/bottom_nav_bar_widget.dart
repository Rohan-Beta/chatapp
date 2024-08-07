// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'package:chatapp/widgets/screen_helper_widget.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  const BottomNavBarWidget({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(index);
      },
      child: Container(
        height:
            // ScreenHeleper.isDesktop(context)
            //     ? (MediaQuery.sizeOf(context).width / 100) * 6
            //     :
            (MediaQuery.sizeOf(context).width / 100) * 13,
        width: ScreenHeleper.isDesktop(context)
            ? (MediaQuery.sizeOf(context).width / 100) * 6
            : (MediaQuery.sizeOf(context).width / 100) * 17,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // black icon as shadow
            (currentIndex == index)
                ? Positioned(
                    left: ScreenHeleper.isDesktop(context)
                        ? (MediaQuery.sizeOf(context).width / 100) * 1.8
                        : ScreenHeleper.isTablet(context)
                            ? (MediaQuery.sizeOf(context).width / 100) * 6.6
                            : (MediaQuery.sizeOf(context).width / 100) * 5,
                    bottom: ScreenHeleper.isDesktop(context)
                        ? (MediaQuery.sizeOf(context).width / 100) * 0.1
                        : ScreenHeleper.isTablet(context)
                            ? (MediaQuery.sizeOf(context).width / 100) * 0.5
                            : (MediaQuery.sizeOf(context).width / 100) * 2,
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: ScreenHeleper.isDesktop(context)
                          ? (MediaQuery.sizeOf(context).width / 100) * 2
                          : ScreenHeleper.isTablet(context)
                              ? (MediaQuery.sizeOf(context).width / 100) * 3
                              : (MediaQuery.sizeOf(context).width / 100) * 6,
                    ),
                  )
                : Container(),

            // main icon
            AnimatedOpacity(
              opacity: (currentIndex == index) ? 1 : 0.2,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              child: Icon(
                icon,
                color: Colors.white,
                size: ScreenHeleper.isDesktop(context)
                    ? (MediaQuery.sizeOf(context).width / 100) * 2
                    : ScreenHeleper.isTablet(context)
                        ? (MediaQuery.sizeOf(context).width / 100) * 3
                        : (MediaQuery.sizeOf(context).width / 100) * 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
