import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/SmokeTimer.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/SmokeFreeTime/SmokeFreeTimeView.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

class SmokeFreeTime extends StatelessWidget {
  const SmokeFreeTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: QCDashColor.odd,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/hill.png'),
          GestureDetector(
              onTap: () {
                Get.to(SmokeFreeTimeView(), transition: Transition.cupertino);
              },
              child: SmokeTimer()),
        ],
      ),
    );
  }
}
