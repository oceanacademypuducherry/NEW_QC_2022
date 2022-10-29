import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:velocity_x/velocity_x.dart';

class AchievementView extends StatelessWidget {
  const AchievementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        backButton: true,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                AchievementCompleteCard(isOpen: true),
                AchievementCompleteCard(isOpen: false),
                AchievementCompleteCard(isOpen: true),
                AchievementCompleteCard(isOpen: false),
                AchievementCompleteCard(isOpen: true),
                AchievementCompleteCard(isOpen: false),
                const SizedBox(height: 50),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: context.screenWidth / 1.2,
      width: context.screenWidth / 1.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(image: Svg('assets/images/cup.svg')),
                if (isOpen)
                  const Image(
                    image: Svg('assets/images/paper.svg', size: Size(200, 200)),
                  ),
                if (!isOpen)
                  Container(
                    height: context.screenWidth / 2.5,
                    width: context.screenWidth / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(75)),
                    child: Icon(
                      Icons.lock,
                      size: context.screenWidth / 8,
                      color: Colors.white54,
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Text(
                  "5 Minutes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  "Smoke free Time",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
