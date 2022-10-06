import 'package:flutter/material.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';

class HealthAndWellness extends StatelessWidget {
  const HealthAndWellness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DashboardTitle(
            title: 'HealthAndWellness',
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                WellnessCard(
                  title: "Yoga",
                  child: Image.asset('assets/images/dashboard/boy.png'),
                ),
                WellnessCard(
                  title: "Affirmation ",
                  child: Image.asset('assets/images/dashboard/boy.png'),
                ),
                WellnessCard(
                  title: "Breath",
                  child: Image.asset('assets/images/dashboard/boy.png'),
                ),
                WellnessCard(
                  title: "Health Tips",
                  child: Image.asset('assets/images/dashboard/boy.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WellnessCard extends StatelessWidget {
  WellnessCard({Key? key, this.title = "Title", this.child}) : super(key: key);
  String title;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: screenWidth / 2.3,
            width: screenWidth / 3,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: QCHealthAndWellness.blueBg,
                borderRadius: BorderRadius.circular(10)),
            child: child ?? SizedBox(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, color: QCHealthAndWellness.blueText),
          )
        ],
      ),
    );
  }
}
