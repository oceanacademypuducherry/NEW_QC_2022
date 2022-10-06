import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/HealthImprovementCollection/HealthImprovementCards.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

class HealthImprovement extends StatefulWidget {
  HealthImprovement({Key? key}) : super(key: key);

  @override
  State<HealthImprovement> createState() => _HealthImprovementState();
}

class _HealthImprovementState extends State<HealthImprovement> {
  UserStatusController userStatus = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => HealthImprovementCards(),
                  transition: Transition.cupertino);
            },
            child: DashboardTitle(
              title: 'Health Improvement',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HealthImporovementItem(
                imagePath: "assets/images/dashboard/heart.png",
                title: "Pulse Rate",
                color: QCHealthColors.pulseRate,
              ),
              HealthImporovementItem(
                imagePath: "assets/images/dashboard/oxygen.png",
                title: "Oxygen Level",
                color: QCHealthColors.oxygen,
              ),
              HealthImporovementItem(
                imagePath: "assets/images/dashboard/carbon.png",
                title: "Pulse Rate",
                color: QCHealthColors.carbon,
              )
            ],
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}

class HealthImporovementItem extends StatelessWidget {
  HealthImporovementItem(
      {Key? key,
      this.imagePath,
      this.title = "Title",
      this.color = Colors.grey})
      : super(key: key);
  String? imagePath;
  String title;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Image.asset(
              imagePath!,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: MediaQuery.of(context).size.width / 25),
          )
        ],
      ),
    );
  }
}
