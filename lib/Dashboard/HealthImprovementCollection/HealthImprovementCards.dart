import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/DataCollection/Login.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:new_qc/main.dart';

class HealthImprovementCards extends StatelessWidget {
  HealthImprovementCards({Key? key}) : super(key: key);

  UserStatusController userStatus = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                      children: userStatus.healthImprovements.map((data) {
                    return Visibility(
                        visible: true,
                        child: Text(
                          '${data}',
                          style: TextStyle(
                              color: !data['isFinish']
                                  ? Colors.green
                                  : Colors.yellow),
                        ));
                  }).toList()),
                ),
                Container()
              ],
            )),
      ),
    );
  }
}
