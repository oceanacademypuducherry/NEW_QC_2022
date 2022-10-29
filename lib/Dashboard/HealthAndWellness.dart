import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/DashboardWidgets/DashboardTitle.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/HealthAndWellness/Affirmation.dart';
import 'package:new_qc/Dashboard/HealthAndWellness/WisdomView.dart';

class HealthAndWellness extends StatelessWidget {
  const HealthAndWellness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF8FCFF),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          DashboardTitle(
            title: 'HealthAndWellness',
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                WellnessCard(
                  title: "Yoga",
                  path: 'assets/images/haw/yoga.png',
                ),
                WellnessCard(
                  title: "Affirmation ",
                  path: 'assets/images/haw/af.png',
                  onPressed: () {
                    Get.to(AffirmationView(), transition: Transition.cupertino);
                  },
                ),
                WellnessCard(
                  title: "Breath",
                  path: 'assets/images/haw/br.png',
                ),
                WellnessCard(
                  title: "Health Tips",
                  path: 'assets/images/haw/ht.png',
                ),
                WellnessCard(
                  title: "Wisdom",
                  path: 'assets/images/haw/wi.png',
                  onPressed: () {
                    Get.to(WisdomView(), transition: Transition.cupertino);
                  },
                ),
              ],
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

class WellnessCard extends StatelessWidget {
  WellnessCard({Key? key, this.title = "Title", this.path, this.onPressed})
      : super(key: key);
  String title;
  String? path;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed ?? null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: screenWidth / 2.3,
              width: screenWidth / 3,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: QCHealthAndWellness.blueBg,
                  borderRadius: BorderRadius.circular(10)),
              child: path != null
                  ? Image.asset(
                      path!,
                      color: QCHealthAndWellness.blueBg,
                      colorBlendMode: BlendMode.multiply,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                    )
                  : SizedBox(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style:
                  TextStyle(fontSize: 18, color: QCHealthAndWellness.blueText),
            )
          ],
        ),
      ),
    );
  }
}
