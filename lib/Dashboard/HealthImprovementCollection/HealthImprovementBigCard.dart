import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'dart:ui' as ui;

class HealthImprovementBigCard extends StatelessWidget {
  HealthImprovementBigCard({
    Key? key,
    this.title = "no title",
    this.description = "None",
    this.isCompleted = false,
    this.imagePath,
    this.colorData = "0xff717171",
    this.progress = 0,
  }) : super(key: key);
  String title;
  String? imagePath;
  String description;
  bool isCompleted;
  String colorData;
  dynamic progress;

  @override
  Widget build(BuildContext context) {
    Color colorValue = Color(int.parse(colorData));
    return Container(
      height: context.screenWidth / 1.4,
      width: context.screenWidth / 1.7,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              spreadRadius: 0,
              blurRadius: 50,
              inset: false,
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -10,
                top: -10,
                child: Container(height: 80, width: 80, color: colorValue),
              ),
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaY: 40, sigmaX: 40),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: colorValue, width: 3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(6, 6),
                          inset: true,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: colorValue,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      description,
                                      style:
                                          TextStyle(color: Color(0xff9B9B9B)),
                                    ),
                                    Text('$progress%')
                                  ],
                                ),
                              ),
                            ),
                            if (isCompleted)
                              Expanded(
                                child:
                                    CircleAvatar(backgroundColor: colorValue),
                              )
                          ],
                        ),
                      ),
                      Container(
                        width: context.screenWidth / 2.9,
                        child: imagePath != null
                            ? Image.asset(
                                imagePath!, //'assets/images/dashboard/oxygen.png'
                                fit: BoxFit.contain,
                              )
                            : CircleAvatar(
                                backgroundColor: Color(0xff9B9B9B),
                                radius: 50,
                              ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
