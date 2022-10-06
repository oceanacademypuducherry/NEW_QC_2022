import 'package:flutter/material.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';

class GuidedMeditation extends StatelessWidget {
  const GuidedMeditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          DashboardTitle(title: "Guided Meditation"),
          SizedBox(height: 8),
          Container(
            height: 200,
            child: Image.asset('assets/images/dashboard/boy.png'),
          )
        ],
      ),
    );
  }
}
