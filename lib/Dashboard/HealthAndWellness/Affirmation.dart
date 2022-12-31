import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'dart:ui';

import 'package:velocity_x/velocity_x.dart';

class AffirmationView extends StatelessWidget {
  AffirmationView({Key? key, this.dataList}) : super(key: key);

  List<String>? dataList;

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
                  children: dataList != null
                      ? dataList!
                          .map(
                            (affirmation) =>
                                textContent(context, quotes: affirmation),
                          )
                          .toList()
                      : [
                          textContent(context, quotes: 'No affirmation'),
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
