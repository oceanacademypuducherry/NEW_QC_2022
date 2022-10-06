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

import 'package:new_qc/Get_X_Controller/HealthImprovementController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserStatusController userStatus = Get.find<UserStatusController>();
  HealthImprovementController hic = Get.find<HealthImprovementController>();

  GetStorage storage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 13);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            userStatus.stopTimer(runTimer: false);

            storage.remove('isLogged');

            ///storage.remove('collectedData');

            Get.to(() => Login());
          },
          child: Icon(Icons.logout),
        ),
        body: BackgroundContainer(
          bg: Image.asset(
            'assets/images/ocean.jpg',
            fit: BoxFit.cover,
          ),
          transparentOpacity: 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 13),
                const SmokeFreeTime(),
                HealthImprovement(),
                MoneySaved(),
                Achievements(),
                GuidedMeditation(),
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
