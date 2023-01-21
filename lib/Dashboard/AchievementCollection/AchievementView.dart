import 'dart:math' as math;
import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:SFM/CommonWidgets/BackgroundContainer.dart';
import 'package:SFM/CommonWidgets/QC_Colors.dart';
import 'package:SFM/Get_X_Controller/UserStatusController.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AchievementView extends StatefulWidget {
  AchievementView({Key? key}) : super(key: key);

  @override
  State<AchievementView> createState() => _AchievementViewState();
}

class _AchievementViewState extends State<AchievementView> {
  List<Map> achievementData = [
    {"title": "You saved 1500 rupees", "cat": 'money', "isOpen": true},
    {"title": "You saved 1500 rupees health", "cat": 'health', "isOpen": false},
    {"title": "You saved 1500 rupees time", "cat": 'time', "isOpen": false},
    {"title": "You saved 1500 rupees time", "cat": 'time', "isOpen": true},
    {"title": "You saved 1500 rupees time", "cat": 'time', "isOpen": false},
    {"title": "You saved 1500 rupees time", "cat": 'time', "isOpen": false},
    {"title": "You saved 1500 rupees mission", "cat": 'mission', "isOpen": true}
  ];

  bool isList = false;

  UserStatusController userContoller = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white70,
          child: TextButton(
            child: Text('Change Design'),
            onPressed: () {
              setState(() {
                isList = !isList;
              });
            },
          ),
        ),
      ),
      body: BackgroundContainer(
        backButton: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                GridView.count(
                    crossAxisCount: isList ? 1 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: isList
                        ? (context.screenHeight / 1.1) / context.screenWidth
                        : context.screenWidth / (context.screenHeight / 1.8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(keepScrollOffset: false),
                    // children: userContoller.userData['achievements']
                    children:
                        // userContoller.healthImprovements.map<Widget>((element)
                        achievementData.map<Widget>((element) {
                      IconData iconData = Icons.ac_unit_outlined;
                      Color color = Colors.green;
                      switch (element['cat']) {
                        case "health":
                          iconData = FontAwesomeIcons.solidHeart;
                          color = Color(0xff3ACBA0);

                          break;
                        case "money":
                          iconData = FontAwesomeIcons.moneyBill1;
                          color = Color(0xffFF6060);
                          break;
                        case "time":
                          iconData = FontAwesomeIcons.clock;
                          color = Color(0xffFE94D7);
                          break;
                        case "mission":
                          iconData = FontAwesomeIcons.flag;
                          color = Color(0xff31D6FA);
                          break;
                        default:
                          iconData = Icons.ac_unit_outlined;
                          color = Colors.green;
                          break;
                      }
                      print(element);

                      return isList
                          ? AchievementCompleteCardList(
                              title: element['title'],
                              iconData: iconData,
                              color: color,
                              isOpen: element['isOpen'],
                            )
                          : AchievementCompleteCard(
                              title: element['title'],
                              iconData: iconData,
                              color: color,
                              isOpen: element['isOpen'],
                            );
                      // return AchievementCompleteCard(
                      //   isOpen: element['isFinish'],
                      //   title: element['title'],
                      //   description: element['description'],
                      // );
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

class AchievementCompleteCardList extends StatelessWidget {
  AchievementCompleteCardList(
      {Key? key,
      this.color = Colors.green,
      this.title = "Title",
      this.isOpen = false,
      this.iconData = Icons.ac_unit_rounded})
      : super(key: key);
  Color color = Colors.green;
  String title = "title";
  bool isOpen = false;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // height: 100,
        // width: 100,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Blur(
                blur: 20,
                child: Container(
                  margin:
                      EdgeInsets.only(top: 40, right: context.screenWidth / 2),
                  color: Colors.white24,
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 0),
                      // color: Colors.blue,
                      height: 250,
                      width: 140,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Center(
                              child: Transform.rotate(
                                angle: -math.pi / 4,
                                child: ClipRRect(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: context.screenWidth / 3.7,
                                        width: context.screenWidth / 3.7,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                offset: const Offset(-5, 5),
                                                blurRadius: 3,
                                                inset: true),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: color.withOpacity(0.8),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              iconData,
                              size: context.screenWidth / 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Title'.text.color(color).bold.size(20).make(),
                      SizedBox(height: 5),
                      title.text
                          .color(Color(0xff7E7E7E))
                          .medium
                          .minFontSize(15)
                          .align(TextAlign.left)
                          .overflow(TextOverflow.ellipsis)
                          .maxLines(3)
                          .make()
                          .box
                          .width(150)
                          .makeCentered(),
                    ],
                  ),
                ],
              ),
            ),
            if (!isOpen)
              Blur(
                blur: 10,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            if (!isOpen)
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(60)),
                child: const Center(
                  child: Icon(
                    Icons.lock,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class AchievementCompleteCard extends StatelessWidget {
  AchievementCompleteCard(
      {Key? key,
      this.color = Colors.green,
      this.title = "Title",
      this.isOpen = false,
      this.iconData = Icons.ac_unit_rounded})
      : super(key: key);
  Color color = Colors.green;
  String title = "title";
  bool isOpen = false;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: context.screenWidth / (context.screenHeight / 1.8),
        child: Container(
          // height: 100,
          // width: 100,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Blur(
                blur: 20,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  color: Colors.white24,
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 40),
                  // color: Colors.blue,

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Transform.rotate(
                            angle: -math.pi / 4,
                            child: ClipRRect(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: context.screenWidth / 3.7,
                                    width: context.screenWidth / 3.7,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            offset: const Offset(-5, 5),
                                            blurRadius: 3,
                                            inset: true),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: color.withOpacity(0.8),
                            border: Border.all(
                              width: 3,
                              color: Colors.black.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          iconData,
                          size: context.screenWidth / 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 10,
                child: title.text
                    .color(Color(0xff7E7E7E))
                    .medium
                    .minFontSize(15)
                    .align(TextAlign.center)
                    .overflow(TextOverflow.ellipsis)
                    .maxLines(2)
                    .make()
                    .box
                    .px8
                    .width(150)
                    .makeCentered(),
              ),
              if (!isOpen)
                Blur(
                  blur: 10,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              if (!isOpen)
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: color.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Icon(
                          Icons.lock,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}

// class AchievementCompleteCard extends StatelessWidget {
//   AchievementCompleteCard(
//       {Key? key,
//       this.isOpen = false,
//       this.title = "Title",
//       this.description = "Description"})
//       : super(key: key);
//   bool isOpen;
//   String title;
//   String description;
//   ScreenshotController _screenshotController = ScreenshotController();
//
//   final ConfettiController _controllerCenterRight =
//       ConfettiController(duration: const Duration(milliseconds: 500));
//
//   _takeshot() async {
//     dynamic byte = await _screenshotController.capture().then((image) async {
//       if (image != null) {
//         final directory = await getApplicationDocumentsDirectory();
//         final imagePath = await File('${directory.path}/image.png').create();
//         await imagePath.writeAsBytes(image);
//         Share.shareXFiles([
//           XFile.fromData(
//             image,
//             path: imagePath.path,
//           ),
//         ], text: "Share text");
//       }
//     });
//   }
//
//   _viewAchievement(BuildContext context) {
//     double sw = context.screenWidth;
//     showDialog(
//         context: context,
//         builder: (_) {
//           _controllerCenterRight.play();
//           Future.delayed(const Duration(seconds: 4), () => {_takeshot()});
//
//           return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             backgroundColor: Colors.transparent,
//             content: Screenshot(
//               controller: _screenshotController,
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 height: sw / 1.1,
//                 width: sw,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   clipBehavior: Clip.none,
//                   children: [
//                     Positioned(
//                       top: ((context.screenHeight / 2) / 2) - 30,
//                       child: ConfettiWidget(
//                         confettiController: _controllerCenterRight,
//                         emissionFrequency: 0.4,
//                         maxBlastForce: 35,
//                         minBlastForce: 5,
//                         gravity: 0.1,
//                         blastDirectionality: BlastDirectionality.explosive,
//                         colors: const [
//                           Colors.green,
//                           Colors.blue,
//                           Colors.pink,
//                           Colors.orange,
//                           Colors.purple
//                         ],
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image(
//                             image: Svg('assets/images/cup.svg',
//                                 size: Size(sw / 2.2, sw / 2.2))),
//                         SizedBox(height: 10),
//                         Text(
//                           title,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: sw / 15,
//                               color: Colors.purple),
//                         ),
//                         Text(
//                           description,
//                           style: TextStyle(
//                               fontSize: sw / 18, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: isOpen == true ? () => _viewAchievement(context) : null,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 0),
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         height: context.screenWidth / 1.2,
//         width: context.screenWidth / 1.6,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Flexible(
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 5),
//                 child: isOpen == true
//                     ? const ColorFiltered(
//                         colorFilter:
//                             ColorFilter.mode(Colors.white, BlendMode.multiply),
//                         child: Image(
//                           image: NetworkImage(
//                               'https://t3.ftcdn.net/jpg/05/39/80/00/360_F_539800080_VdSxomYJmVS77Mt6EpiaNfevaBYnRMU1.jpg'),
//                         ),
//                       )
//                     : const ColorFiltered(
//                         colorFilter:
//                             ColorFilter.mode(Colors.grey, BlendMode.saturation),
//                         child: Image(
//                           image: NetworkImage(
//                               'https://t3.ftcdn.net/jpg/05/39/80/00/360_F_539800080_VdSxomYJmVS77Mt6EpiaNfevaBYnRMU1.jpg'),
//                         ),
//                       ),
//               ),
//             ),
//             Flexible(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18,
//                       color: isOpen == true ? Colors.purple : Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     description,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: isOpen == true ? Colors.black87 : Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
