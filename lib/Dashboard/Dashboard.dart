import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/Dashboard/Achievements.dart';
import 'package:new_qc/Dashboard/GuidedMeditation.dart';
import 'package:new_qc/Dashboard/HealthAndWellness.dart';
import 'package:new_qc/Dashboard/HealthImprovement.dart';
import 'package:new_qc/Dashboard/MoneySaved.dart';
import 'package:new_qc/Dashboard/SmokeFreeTime.dart';
import 'package:new_qc/DataCollection/Login.dart';
import 'package:new_qc/Get_X_Controller/API_Controller.dart';

import 'package:new_qc/Get_X_Controller/HealthImprovementController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserStatusController userStatus = Get.find<UserStatusController>();

  HealthImprovementController hic = Get.find<HealthImprovementController>();
  APIController apiController = Get.find<APIController>();

  GetStorage storage = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // apiController.backupAction();
    ///ToDO with out API
    userStatus.readSessionData();

    ///ToDO with out API
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: BackgroundContainer(
          isDashboard: true,
          bg: Image.asset(
            'assets/images/ocean.jpg',
            fit: BoxFit.cover,
          ),
          transparentOpacity: 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height / 13),
                const SmokeFreeTime(),
                HealthImprovement(),
                MoneySaved(),
                Achievements(),
                const GuidedMeditation(),
                HealthAndWellness(),
                SizedBox(height: MediaQuery.of(context).size.height / 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
