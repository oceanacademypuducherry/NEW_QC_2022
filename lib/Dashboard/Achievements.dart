import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/AchievementCollection/AchievementView.dart';
import 'package:velocity_x/velocity_x.dart';

class Achievements extends StatelessWidget {
  Achievements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AchievementView(), transition: Transition.cupertino);
      },
      child: Container(
        color: QCDashColor.even,
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

            Container(
              width: context.screenWidth / 1.3,
              height: context.screenWidth / 2.3,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Positioned(
                    left: -170,
                    top: -80,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image(
                        image: Svg('assets/images/paper.svg',
                            size: Size(200, 200)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Image(
                      image: Svg('assets/images/dashboard/cup_group.svg',
                          size: Size(120, 120))),
                  Positioned(
                    right: -0,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image(
                        image: Svg('assets/images/paper.svg',
                            size: Size(200, 200)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
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
  AchievementCard({
    Key? key,
    this.isCompleted = false,
  }) : super(key: key);

  bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5 Minutes ',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: isCompleted
                          ? QCMoneyColor.weeklySaving
                          : Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  'Smoke Free Time',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[700]),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white, isCompleted ? BlendMode.darken : BlendMode.hue),
              child: Image.asset('assets/images/dashboard/cup.png'),
            ),
          )
        ],
      ),
    );
  }
}
