import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'dart:ui';

import 'package:velocity_x/velocity_x.dart';

class AffirmationView extends StatelessWidget {
  const AffirmationView({Key? key}) : super(key: key);

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
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/afBg.png'),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: PageView(
                  children: [
                    textContent(context,
                        quotes: 'I can do anything I decide to do.'),
                    textContent(context,
                        quotes: 'I love being in control of my life.'),
                    textContent(context,
                        quotes:
                            'I am strong enough to handle the challenge of breaking this habit.'),
                  ],
                )),
          )),
    );
  }

  Center textContent(BuildContext context, {quotes}) {
    return Center(
      child: Container(
        width: context.screenWidth / 1.1,
        child: Text(
          quotes,
          style: const TextStyle(
            fontSize: 35,
            fontFamily: "Kalam",
            height: 1.3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
