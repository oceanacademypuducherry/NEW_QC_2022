import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:velocity_x/velocity_x.dart';

class BreathPlayer extends StatelessWidget {
  BreathPlayer({Key? key, this.color = Colors.white, this.title = "title"})
      : super(key: key);

  Color color;
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundContainer(
          backButton: true,
          child: Container(
            color: QCDashColor.odd,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.screenWidth / 1.3,
                    width: context.screenWidth / 1.3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: context.screenWidth / 1.5,
                          width: context.screenWidth / 1.5,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(
                                context.screenWidth / 1.5),
                          ),
                        ),
                        Container(
                          height: context.screenWidth / 2,
                          width: context.screenWidth / 2,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.circular(context.screenWidth / 2),
                          ),
                        ),
                        '3'.text.bold.size(50).color(color).make()
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  title.text.size(20).color(Vx.gray600).bold.make(),
                  const SizedBox(height: 30),
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: color, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        "05:00".text.color(color).bold.make(),
                        Spacer(),
                        Icon(
                          Icons.play_arrow_rounded,
                          color: color,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
