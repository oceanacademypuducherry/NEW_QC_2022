import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  BackgroundContainer(
      {Key? key, required this.child, this.bg, this.transparentOpacity = 0.4})
      : super(key: key);

  Widget child;
  Widget? bg;
  double transparentOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: bg ??
                  Image.asset(
                    'assets/images/bg.png',
                    fit: BoxFit.cover,
                  )),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(
              color: Colors.white.withOpacity(transparentOpacity),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: child,
          )
        ],
      ),
    );
  }
}
