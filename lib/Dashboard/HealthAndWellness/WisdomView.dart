import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:velocity_x/velocity_x.dart';

class WisdomView extends StatelessWidget {
  const WisdomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          backButton: true,
          action: Icon(
            FontAwesomeIcons.ellipsisVertical,
            color: Colors.white.withOpacity(0.5),
          ),
          backButtonChild: QCBackButton(
            color: Colors.white.withOpacity(0.6),
          ),
          child: PageView(
            children: [
              wisdomView(context,
                  quotes: "Change your thoughts and you change your world.",
                  path: 'assets/images/w1.png'),
              wisdomView(context,
                  quotes:
                      "Very little is needed to make a happy life, it is all within yourself, in your way of thinking.",
                  path: 'assets/images/w2.png'),
              wisdomView(context,
                  quotes:
                      "Life can be simple and beautiful. Focus on the good things.",
                  path: 'assets/images/w3.png'),
            ],
          )),
    );
  }

  Container wisdomView(BuildContext context, {quotes, path}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: context.screenWidth / 1.1,
            color: Colors.black26,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
              child: Text(
                quotes,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: "Kalam",
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
