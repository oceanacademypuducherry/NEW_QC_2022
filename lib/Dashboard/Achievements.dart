import 'package:flutter/material.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';

class Achievements extends StatelessWidget {
  Achievements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          DashboardTitle(
            title: "Achievements",
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AchievementCard(
                  isCompleted: true,
                ),
                AchievementCard(
                  isCompleted: false,
                )
              ],
            ),
          )
        ],
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