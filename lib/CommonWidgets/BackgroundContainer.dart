import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Craving/Craving.dart';
import 'package:new_qc/Dashboard/Dashboard.dart';
import 'package:new_qc/Dashboard/HealthImprovement.dart';
import 'package:new_qc/DataCollection/Login.dart';
import 'package:new_qc/Get_X_Controller/BottomNavController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

import 'package:new_qc/Journal/Journal/journal.dart';
import 'package:new_qc/Mission/Mission.dart';
import 'package:new_qc/More/More.dart';
import 'package:new_qc/practice/particuls.dart';
import 'package:velocity_x/velocity_x.dart';

class BackgroundContainer extends StatelessWidget {
  BackgroundContainer(
      {Key? key,
      required this.child,
      this.bg,
      this.transparentOpacity = 0.4,
      this.backButtonChild,
      this.isDashboard = false,
      this.backButton = false,
      this.padding,
      this.title = "",
      this.action})
      : super(key: key);

  Widget child;
  Widget? bg;
  double transparentOpacity;
  UserStatusController userStatus = Get.find<UserStatusController>();
  GetStorage storage = GetStorage();
  bool isDashboard = false;
  bool backButton = false;
  Widget? backButtonChild;
  Widget? action;
  EdgeInsets? padding;
  String title;

  BottomNavController bottomNavController = Get.find<BottomNavController>();

  List<List<String>> iconPath = [
    ['assets/images/navbar/home.svg', 'assets/images/navbar/a_home.svg'],
    ['assets/images/navbar/mission.svg', 'assets/images/navbar/a_mission.svg'],
    ['assets/images/navbar/journal.svg', 'assets/images/navbar/a_journal.svg'],
    ['assets/images/navbar/craving.svg', 'assets/images/navbar/a_craving.svg'],
    ['assets/images/navbar/more.svg', 'assets/images/navbar/a_more.svg'],
  ];

  List<Widget> pages = [Dashboard(), Missions(), Journal(), Craving(), More()];

  navbarAdding() {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            child: bg ??
                Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.cover,
                )),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
          child: Container(
            color: Colors.white.withOpacity(transparentOpacity),
          ),
        ),
        Container(
          padding: padding,
          width: double.infinity,
          child: child,
        ),
        if (isDashboard)
          Positioned(
              bottom: 0,
              child: Hero(
                  tag: "bottom-nav",
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    decoration: BoxDecoration(
                        color: QCDashColor.even,
                        // color: Colors.red,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: iconPath.map<Widget>((paths) {
                                int index = iconPath.indexOf(paths);

                                return QCBottomNavItem(
                                  icon: paths,
                                  activeIndex:
                                      bottomNavController.activeIndex.value,
                                  tabIndex: index,
                                  onPressed: () {
                                    bottomNavController.changeTab(index);

                                    Get.offAll(pages[index],
                                        transition: Transition.upToDown);
                                  },
                                );
                              }).toList()

                              ///TODO: logout function
                              // Container(
                              //     width: 40,
                              //     child: GestureDetector(
                              //       onTap: () async {
                              //         userStatus.stopTimer(runTimer: false);
                              //
                              //         storage.remove('isLogged');
                              //
                              //         ///storage.remove('collectedData');
                              //
                              //         // Get.to(() => Login());
                              //       },
                              //     )),

                              ),
                        )
                      ],
                    ),
                  ))),
        if (backButton)
          Positioned(
              top: context.screenHeight / 18,
              left: 0,
              child: Container(
                width: context.screenWidth,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: backButtonChild ?? QCBackButton(),
                    ),
                    title.text
                        .size(20)
                        .fontWeight(FontWeight.w500)
                        .color(Vx.gray600)
                        .make(),
                    if (action != null) Positioned(right: 10, child: action!),
                  ],
                ),
              ))
      ],
    );
  }
}

class QCBottomNavItem extends StatelessWidget {
  QCBottomNavItem({
    required this.icon,
    this.onPressed,
    required this.tabIndex,
    required this.activeIndex,
    Key? key,
  }) : super(key: key);
  List<String> icon;
  VoidCallback? onPressed;
  int activeIndex;
  int tabIndex;

  @override
  Widget build(BuildContext context) {
    bool input = activeIndex == tabIndex;
    return Container(
      width: 50,
      // color: Colors.blue,
      child: GestureDetector(
        onTap: onPressed,
        child: Image(
          image: Svg(
            input ? icon[1] : icon[0],
            //size: Size(60, 60),
          ),
        ),
      ),
    );
  }
}
