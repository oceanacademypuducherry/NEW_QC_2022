import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/SmokeTimer.dart';

class SmokeFreeTime extends StatelessWidget {
  const SmokeFreeTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/hill.png'),
          SmokeTimer(),
        ],
      ),
    );
  }
}
