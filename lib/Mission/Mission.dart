import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:new_qc/Get_X_Controller/MissionController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:new_qc/Mission/MissionView.dart';
import 'package:velocity_x/velocity_x.dart';

class Missions extends StatelessWidget {
  Missions({Key? key}) : super(key: key);

  MissionController _missionController = Get.find<MissionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        isDashboard: true,
        padding: EdgeInsets.symmetric(vertical: 0),
        child: SingleChildScrollView(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  if (_missionController.missionDay.value <= 0)
                    const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text("your mission will start Tomorrow"),
                      ),
                    ),
                  ...List.generate(_missionController.missionData.length,
                      (index) {
                    final data = _missionController.missionData;
                    return MissionTail(
                      missionData: data[index],
                      missionIndex: index + 1,
                      currentDayCount: _missionController.missionDay.value,
                    );
                  }),
                  SizedBox(height: 80),
                ],
              )),
        ),
      ),
    );
  }
}

class MissionTail extends StatelessWidget {
  MissionTail({
    Key? key,
    this.missionData,
    this.missionIndex = 0,
    this.currentDayCount = 0,
  }) : super(key: key);
  // UserStatusController _userStatus = Get.find<UserStatusController>();
  Map? missionData;
  int currentDayCount;
  int missionIndex;

  Icon buildIcon(BuildContext context,
      {bool isComplete = false, int missionOpenDay = 365}) {
    if (isComplete) {
      return Icon(
        FontAwesomeIcons.check,
        size: context.screenHeight / 40,
        color: Colors.green,
      );
    } else {
      if (missionOpenDay <= currentDayCount) {
        return Icon(
          FontAwesomeIcons.lockOpen,
          size: context.screenHeight / 40,
          color: Colors.grey,
        );
      } else {
        return Icon(
          FontAwesomeIcons.lock,
          size: context.screenHeight / 40,
          color: Colors.grey[600],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            splashColor: Colors.grey,
            child: Container(
              width: context.screenWidth / 1.1,
              height: context.screenHeight / 10,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white60,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: "mission_img${missionData!['openDay']}",
                    child: Image(
                      image: Svg(missionData!['missionVector'] ??
                          'assets/images/mission/plant.svg'),
                    ),
                  ),
                  const SizedBox(width: 5),
                  "Mission-$missionIndex"
                      .text
                      .bold
                      .fontFamily('Roboto')
                      .color(const Color(0xff515151))
                      .size(context.screenHeight / 40)
                      .make(),
                  const Spacer(),
                  buildIcon(context,
                      isComplete: missionData!['isComplete'],
                      missionOpenDay: missionData!['openDay'])
                ],
              ),
            ),
            onTap: () async {
              print(missionData);
              print(currentDayCount);
              if (missionData!['openDay'] > currentDayCount) {
                Get.snackbar(
                  'Mission Locked',
                  "Mission Unlocked soon",
                  isDismissible: true,
                );
                return;
              }
              Get.to(
                  () => MissionView(
                        missionIndex: missionIndex,
                      ),
                  arguments: missionData,
                  transition: Transition.cupertino);
            },
          ),
        ),
      ),
    );
  }
}
