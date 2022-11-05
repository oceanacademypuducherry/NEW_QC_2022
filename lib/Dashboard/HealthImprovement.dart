import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/HealthImprovementCollection/HealthImprovementBigCard.dart';
import 'package:new_qc/Dashboard/HealthImprovementCollection/HealthImprovementCards.dart';
import 'package:new_qc/Dashboard/HealthImprovementCollection/HealthImprovementView.dart';
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
      color: QCDashColor.even,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => HealthImprovementView(),

                  // HealthImprovementCards(),
                  transition: Transition.cupertino);
            },
            child: DashboardTitle(
              title: 'Health Improvement',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  userStatus.healthWidget.length >= 3
                      ? 3
                      : userStatus.healthWidget.length, (index) {
                Map data = userStatus.healthWidget[index];
                return HealthImporovementItem(
                  imagePath: data['imagePath'],
                  title: data['title'],
                  colorData: data['colorData'],
                );
              })))
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
      this.colorData = "0xff717171"})
      : super(key: key);
  String? imagePath;
  String title;
  String colorData;

  @override
  Widget build(BuildContext context) {
    Color color = Color(int.parse(colorData));
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
              color: color,
              fontSize: MediaQuery.of(context).size.width / 25,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
