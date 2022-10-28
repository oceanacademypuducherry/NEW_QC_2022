import 'package:flutter/material.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';

class GuidedMeditation extends StatelessWidget {
  const GuidedMeditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: QCDashColor.odd,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          DashboardTitle(title: "Guided Meditation"),
          SizedBox(height: 8),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/dashboard/boy.png',
              color: QCDashColor.odd,
              colorBlendMode: BlendMode.multiply,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
