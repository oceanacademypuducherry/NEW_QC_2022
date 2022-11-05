import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/Dashboard/HealthAndWellness/BreathPlayer.dart';
import 'package:velocity_x/velocity_x.dart';

class BreathCards extends StatelessWidget {
  const BreathCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        backButton: true,
        child: Column(
          children: [
            SizedBox(height: context.screenHeight / 9),
            const Text(
              "Breath and Realex",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff525252)),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BreathCard(
                  src: 'assets/images/breath/eq.svg',
                  title: "Equal Breath",
                  subtitle: "Equal Breathing helps you to relax and focus.",
                  color: Color(0xff95E4B6),
                  bgColor: Color(0xffEDFFF4),
                ),
                BreathCard(
                  src: 'assets/images/breath/box.svg',
                  title: "Box Breathing",
                  subtitle: "Box Breathing is a powerfull stress reliver.",
                  color: Color(0xff8AE5EC),
                  bgColor: Color(0xffE4FDFF),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BreathCard(
                  src: 'assets/images/breath/tri.svg',
                  title: "4-7-8 Breathing",
                  subtitle: "4-7-8  Breathing promotes better sleep.",
                  color: Color(0xffEFD4AD),
                  bgColor: Color(0xffFFF4E4),
                ),
                BreathCard(
                  src: 'assets/images/breath/hold.svg',
                  title: "Breath Hoalding Test",
                  subtitle: "Test your breath-holding capacity",
                  color: Color(0xffECAFAF),
                  bgColor: Color(0xffFBDBDB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BreathCard extends StatelessWidget {
  BreathCard(
      {Key? key,
      this.title = "title",
      this.subtitle = "subtitle",
      this.src,
      this.color = Colors.black26,
      this.onPressed,
      this.bgColor = Colors.grey})
      : super(key: key);
  String title;
  String subtitle;
  String? src;
  Color color;
  Color bgColor;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            BreathPlayer(
              color: color,
              title: title,
            ),
            transition: Transition.cupertino);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: context.screenWidth / 2.5,
        height: context.screenWidth / 1.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(
                    0.1,
                  ),
                  spreadRadius: 0,
                  blurRadius: 15)
            ]),
        child: Column(
          children: [
            Expanded(
                flex: 9,
                child: Image(
                  image: Svg(
                    src!,
                    size: Size(40, 40),
                  ),
                )),
            Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        // color:color,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
