import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Craving/add_cravings.dart';
import 'package:new_qc/Craving/cravings_chart.dart';
import 'package:new_qc/Get_X_Controller/cravings_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class Craving extends StatelessWidget {
  Craving({Key? key}) : super(key: key);

  CravingsController _cravingsController = Get.find<CravingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        isDashboard: true,
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight / 8,
            ),
            const Text(
              "Cravings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: context.screenWidth,
              child: CravingsChart(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: context.screenWidth / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Material(
                  color: Colors.white54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.plus,
                        color: QCColors.chipSelectedBg,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      'Add Craving'
                          .text
                          .color(QCColors.chipSelectedBg)
                          .bold
                          .size(15)
                          .make()
                    ],
                  ).box.height(50).makeCentered().onInkTap(() {
                    Get.to(AddCravings(), transition: Transition.cupertino);
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
