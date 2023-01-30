import 'package:SFM/Get_X_Controller/AchievementController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SFM/CommonWidgets/BackgroundContainer.dart';
import 'package:SFM/Get_X_Controller/DataCollectionController.dart';
import 'package:SFM/Get_X_Controller/UserStatusController.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';

class MoneySavedInfo extends StatelessWidget {
  MoneySavedInfo({Key? key}) : super(key: key);

  AchievementController achievementController =
      Get.find<AchievementController>();
  UserStatusController userStatus = Get.find<UserStatusController>();
  @override
  Widget build(BuildContext context) {
    Size s = context.screenSize;
    Color textColor = Color(0xff06845E);
    return Scaffold(
      body: BackgroundContainer(
        backButton: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money_saved.png',
              width: context.screenWidth / 1.5,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            "Total Saving"
                .text
                .fontFamily('Ubuntu')
                .color(textColor)
                .size(s.width / 14)
                .make(),
            const SizedBox(height: 10),
            Obx(() {
              double totalAmount = achievementController.dayOfCost *
                  userStatus.totalSmokeFreeTime['days']!;
              return "₹$totalAmount"
                  .text
                  .fontFamily('Ubuntu')
                  .color(textColor)
                  .size(s.width / 10)
                  .bold
                  .make();
            }),
          ],
        ),
      ),
    );
  }

  Container moneyTail(
    BuildContext context, {
    color,
    title,
    amount,
  }) {
    return Container(
      width: context.screenWidth / 1.2,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5)),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: TextStyle(fontWeight: FontWeight.w600, color: color),
          ),
          Text(
            amount ?? "",
            style: TextStyle(fontWeight: FontWeight.w600, color: color),
          )
        ],
      ),
    );
  }
}
