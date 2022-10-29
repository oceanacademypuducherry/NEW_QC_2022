import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/HealthImprovementCollection/HealthImprovementBigCard.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:velocity_x/velocity_x.dart';

class HealthImprovementView extends StatelessWidget {
  HealthImprovementView({Key? key}) : super(key: key);
  UserStatusController userStatus = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          isDashboard: false,
          backButton: true,
          child: Container(
            width: context.screenWidth,
            color: QCDashColor.odd,
            child: Obx(() => SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 60,
                    ),
                    ...userStatus.healthImprovements.map((data) {
                      final prog = ((100 * data["totalMinutesOrDays"]) /
                              data["calculationTime"])
                          .toStringAsFixed(1);
                      return HealthImprovementBigCard(
                        title: data['title'],
                        description: data['description'],
                        progress: data['isFinish'] ? 100 : prog,
                        isCompleted: data['isFinish'],
                        colorData: data['colorData'],
                        imagePath: data['imagePath'],
                      );
                    }).toList(),
                  ]),
                )),
          )),
    );
  }
}
