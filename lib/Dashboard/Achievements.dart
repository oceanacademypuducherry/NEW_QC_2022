import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/AchievementCollection/AchievementView.dart';
import 'package:new_qc/practice/practice.dart';
import 'package:velocity_x/velocity_x.dart';

class Achievements extends StatelessWidget {
  Achievements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AchievementView(), transition: Transition.cupertino);
        Get.to(Practice(), transition: Transition.cupertino);
      },
      child: Container(
        // color: QCDashColor.even,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        width: context.screenWidth,
        child: Column(
          children: [
            DashboardTitle(
              title: "Achievements",
            ),

            const SizedBox(height: 10),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       AchievementCard(
            //         isCompleted: true,
            //       ),
            //       AchievementCard(
            //         isCompleted: false,
            //       )
            //     ],
            //   ),
            // )

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AchievementCard(
                    title: "Health",
                    imagePath: 'assets/images/he_ah.png',
                    color: Color(0xff1455B8),
                  ),
                  AchievementCard(
                    title: "Time",
                    imagePath: 'assets/images/ti_ah.png',
                    color: Color(0xffFCA364),
                  ),
                  AchievementCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  AchievementCard(
      {Key? key,
      this.title = 'Title',
      this.color = Colors.black,
      this.imagePath = 'assets/images/he_ah.png'})
      : super(key: key);
  String imagePath;
  Color color;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 2.2,
      height: context.screenWidth / 1.8,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 10),
          title.text.color(color).size(20).fontFamily("Montserrat").bold.make()
        ],
      ),
    );
  }
}
