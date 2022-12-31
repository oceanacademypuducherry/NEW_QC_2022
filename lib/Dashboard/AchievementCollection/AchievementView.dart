import 'dart:io';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AchievementView extends StatelessWidget {
  AchievementView({Key? key}) : super(key: key);

  List<Widget> ah = [
    AchievementCompleteCard(isOpen: true),
    AchievementCompleteCard(isOpen: false),
    AchievementCompleteCard(isOpen: true),
    AchievementCompleteCard(isOpen: false),
    AchievementCompleteCard(isOpen: true),
    AchievementCompleteCard(isOpen: false),
    AchievementCompleteCard(isOpen: true),
    AchievementCompleteCard(isOpen: false),
    AchievementCompleteCard(isOpen: true),
    AchievementCompleteCard(isOpen: false),
  ];
  UserStatusController userContoller = Get.find<UserStatusController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        backButton: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        context.screenWidth / (context.screenHeight / 1.8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(keepScrollOffset: false),
                    // children: userContoller.userData['achievements']
                    children:
                        userContoller.healthImprovements.map<Widget>((element) {
                      print(element);
                      return AchievementCompleteCard(
                          isOpen: element['isFinish']);
                    }).toList()),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AchievementCompleteCard extends StatelessWidget {
  AchievementCompleteCard({
    Key? key,
    this.isOpen = false,
  }) : super(key: key);
  bool isOpen;
  ScreenshotController _screenshotController = ScreenshotController();

  final ConfettiController _controllerCenterRight =
      ConfettiController(duration: const Duration(milliseconds: 500));

  _takeshot() async {
    dynamic byte = await _screenshotController.capture().then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        Share.shareXFiles([
          XFile.fromData(
            image,
            path: imagePath.path,
          ),
        ], text: "Share text");
      }
    });
  }

  _viewAchievement(BuildContext context) {
    double sw = context.screenWidth;
    showDialog(
        context: context,
        builder: (_) {
          _controllerCenterRight.play();
          Future.delayed(const Duration(seconds: 4), () => {_takeshot()});

          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: Screenshot(
              controller: _screenshotController,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                height: sw / 1.1,
                width: sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: ((context.screenHeight / 2) / 2) - 30,
                      child: ConfettiWidget(
                        confettiController: _controllerCenterRight,
                        emissionFrequency: 0.4,
                        maxBlastForce: 35,
                        minBlastForce: 5,
                        gravity: 0.1,
                        blastDirectionality: BlastDirectionality.explosive,
                        colors: const [
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: Svg('assets/images/cup.svg',
                                size: Size(sw / 2.2, sw / 2.2))),
                        SizedBox(height: 10),
                        Text(
                          "5 Minutes",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: sw / 15,
                              color: Colors.purple),
                        ),
                        Text(
                          "Smoke free Time",
                          style: TextStyle(
                              fontSize: sw / 18, color: Colors.black87),
                        ),
                      ],
                    ),
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: IconButton(
                    //       onPressed: () async {
                    //         _controllerCenterRight.play();
                    //         await Future.delayed(Duration(milliseconds: 1500));
                    //         _takeshot();
                    //       },
                    //       icon: Icon(FontAwesomeIcons.share)),
                    // ),
                    // Positioned(
                    //   bottom: 0,
                    //   left: 0,
                    //   child: IconButton(
                    //       onPressed: () async {
                    //         // _controllerCenterRight.play();
                    //         // await Future.delayed(Duration(milliseconds: 1500));
                    //         _takeshot();
                    //       },
                    //       icon: Icon(FontAwesomeIcons.share)),
                    // ),
                    // Positioned(
                    //   bottom: 0,
                    //   child: IconButton(
                    //       onPressed: () async {
                    //         _controllerCenterRight.play();
                    //       },
                    //       icon: Icon(FontAwesomeIcons.share)),
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isOpen == true ? () => _viewAchievement(context) : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: context.screenWidth / 1.2,
        width: context.screenWidth / 1.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: isOpen == true
                    ? const ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.multiply),
                        child: Image(
                          image: NetworkImage(
                              'https://t3.ftcdn.net/jpg/05/39/80/00/360_F_539800080_VdSxomYJmVS77Mt6EpiaNfevaBYnRMU1.jpg'),
                        ),
                      )
                    : const ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.saturation),
                        child: Image(
                          image: NetworkImage(
                              'https://t3.ftcdn.net/jpg/05/39/80/00/360_F_539800080_VdSxomYJmVS77Mt6EpiaNfevaBYnRMU1.jpg'),
                        ),
                      ),
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(
                    "5 Minutes",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: isOpen == true ? Colors.purple : Colors.grey,
                    ),
                  ),
                  Text(
                    "Smoke free Time",
                    style: TextStyle(
                      fontSize: 15,
                      color: isOpen == true ? Colors.black87 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
