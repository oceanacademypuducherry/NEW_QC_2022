import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';

class MoneySavedInfo extends StatelessWidget {
  MoneySavedInfo({Key? key}) : super(key: key);

  UserStatusController _userState = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        backButton: true,
        bg: Container(
          color: Color(0xffE2F0F9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                  width: context.screenWidth / 1.2,
                  height: context.screenWidth / 1.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/dashboard/cash_coin.png',
                        width: context.screenWidth / 1.4,
                        fit: BoxFit.contain,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Image.asset(
                          'assets/images/dashboard/cash_coin.png',
                          width: context.screenWidth / 1.5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  moneyTail(
                    context,
                    color: Color(0xff23A820),
                    title: "Total Savings",
                    amount:
                        '₹${_userState.moneyViewer(type: _userState.totalSmokeFreeTime['days'])}',
                  ),
                  SizedBox(height: 20),
                  moneyTail(
                    context,
                    color: Color(0xffCB7D08),
                    title: "Weekly Savings",
                    amount: '₹${_userState.moneyViewer(type: 7)}',
                  ),
                  moneyTail(
                    context,
                    color: Color(0xffCB7D08),
                    title: "Monthly Savings",
                    amount: '₹${_userState.moneyViewer(type: 30.5)}',
                  ),
                  moneyTail(
                    context,
                    color: Color(0xffCB7D08),
                    title: "Yearly Savings",
                    amount: '₹${_userState.moneyViewer(type: 30.5 * 12)}',
                  ),
                ],
              ),
            ),
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
