import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:velocity_x/velocity_x.dart';

class SmokeFreeTimeView extends StatelessWidget {
  SmokeFreeTimeView({Key? key}) : super(key: key);

  UserStatusController userstatus = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(),
          const Positioned(
              right: -80,
              bottom: -160,
              child: Image(
                image: Svg('assets/images/hill.svg', size: Size(800, 800)),
              )),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              child: Obx(() => Column(
                    children: [
                      timing(context, time: "years"),
                      timing(context, time: "months"),
                      timing(context, time: "days"),
                      timing(context, time: "hours"),
                      timing(context, time: "minutes"),
                      timing(context, time: "seconds"),
                    ],
                  )),
            ),
          ),
          Positioned(child: QCBackButton())
        ],
      ),
    ));
  }

  Container timing(BuildContext context, {time}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: context.screenWidth / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$time",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color(0xff81BAEE)),
          ),
          Text(
            userstatus.smokeFreeTime["$time"].toString(),
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color(0xff81BAEE)),
          )
        ],
      ),
    );
  }
}
