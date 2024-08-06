// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:chatapp/utils/colors.dart';
import 'package:chatapp/utils/text.dart';
import 'package:chatapp/widgets/bottom_nav_bar_widget.dart';
import 'package:chatapp/widgets/bottom_navigation.dart';
import 'package:chatapp/widgets/clipper_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppTexts.appName,
          // style: Theme.of(context).textTheme.headlineSmall,
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Column(),
            Positioned.fill(
              child: Column(),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 120, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          backgroundColor: dPrimaryColor,
                          child: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomNaviagtion(),
              // child: _buildBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildBottomNavBar() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
  //     child: Container(
  //       width: MediaQuery.sizeOf(context).width,
  //       // height: 60,
  //       height: (MediaQuery.sizeOf(context).width / 100) * 14,
  //       decoration: BoxDecoration(
  //         color: Theme.of(context).colorScheme.primaryContainer,
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: Stack(
  //         children: [
  //           // list of bottom with icons
  //           Positioned(
  //             bottom: 0,
  //             top: 0,
  //             left: (MediaQuery.sizeOf(context).width / 100) * 3,
  //             right: (MediaQuery.sizeOf(context).width / 100) * 3,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 BottomNavBarWidget(
  //                   icon: Icons.chat_outlined,
  //                   index: 0,
  //                   currentIndex: _currentIndex,
  //                   onPressed: (val) {
  //                     // Get.offAllNamed("/homeScreen");
  //                     setState(
  //                       () {
  //                         _currentIndex = val;
  //                       },
  //                     );
  //                   },
  //                 ),
  //                 BottomNavBarWidget(
  //                   icon: Icons.groups_2_outlined,
  //                   index: 1,
  //                   currentIndex: _currentIndex,
  //                   onPressed: (val) {
  //                     // Get.offAllNamed("/groupScreen");
  //                     setState(
  //                       () {
  //                         _currentIndex = val;
  //                       },
  //                     );
  //                   },
  //                 ),
  //                 BottomNavBarWidget(
  //                   icon: Icons.call_outlined,
  //                   index: 2,
  //                   currentIndex: _currentIndex,
  //                   onPressed: (val) {
  //                     // Get.offAllNamed("/callScreen");
  //                     setState(
  //                       () {
  //                         _currentIndex = val;
  //                       },
  //                     );
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // animated indicator for selected items
  //           AnimatedPositioned(
  //             duration: Duration(milliseconds: 300),
  //             curve: Curves.decelerate,
  //             left: _currentIndex == 0
  //                 ? (MediaQuery.sizeOf(context).width) * 0.123
  //                 : _currentIndex == 1
  //                     ? (MediaQuery.sizeOf(context).width) * 0.43
  //                     : (MediaQuery.sizeOf(context).width) * 0.734,
  //             child: Column(
  //               children: [
  //                 Container(
  //                   height: (MediaQuery.sizeOf(context).width / 100) * 1.0,
  //                   width: (MediaQuery.sizeOf(context).width / 100) * 12,
  //                   decoration: BoxDecoration(
  //                     color: dPrimaryColor,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 ClipPath(
  //                   clipper: MyCustomClipper(
  //                     blockSizeHorizontal:
  //                         MediaQuery.sizeOf(context).width / 100,
  //                   ),
  //                   child: Container(
  //                     // height: 50,
  //                     height: (MediaQuery.sizeOf(context).width / 100) * 15,
  //                     width: (MediaQuery.sizeOf(context).width / 100) * 12,
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(
  //                         colors: [
  //                           dPrimaryColor.withOpacity(0.8),
  //                           dPrimaryColor.withOpacity(0.5),
  //                           Colors.transparent,
  //                         ],
  //                         begin: Alignment.topCenter,
  //                         end: Alignment.bottomCenter,
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
