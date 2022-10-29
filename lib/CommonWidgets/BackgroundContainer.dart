import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/CommonWidgets/BackButton.dart';
import 'package:new_qc/DataCollection/Login.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:velocity_x/velocity_x.dart';

class BackgroundContainer extends StatelessWidget {
  BackgroundContainer(
      {Key? key,
      required this.child,
      this.bg,
      this.transparentOpacity = 0.4,
      this.backButtonChild,
      this.isDashboard = false,
      this.backButton = false,
      this.action})
      : super(key: key);

  Widget child;
  Widget? bg;
  double transparentOpacity;
  UserStatusController userStatus = Get.find<UserStatusController>();
  GetStorage storage = GetStorage();
  bool isDashboard = false;
  bool backButton = false;
  Widget? backButtonChild;
  Widget? action;

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
          ),
          if (isDashboard)
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Bottom_Nav.png',
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              child: GestureDetector(
                                onTap: () {
                                  print('home');
                                },
                              ),
                            ),
                            Container(
                              width: 40,
                              child: GestureDetector(
                                onTap: () {
                                  print('missions');
                                },
                              ),
                            ),
                            Container(
                              width: 40,
                              child: GestureDetector(
                                onTap: () {
                                  print('journal');
                                },
                              ),
                            ),
                            Container(
                              width: 40,
                              child: GestureDetector(
                                onTap: () {
                                  print('cravings');
                                },
                              ),
                            ),
                            Container(
                                width: 40,
                                child: GestureDetector(
                                  onTap: () async {
                                    userStatus.stopTimer(runTimer: false);

                                    storage.remove('isLogged');

                                    ///storage.remove('collectedData');

                                    Get.to(() => Login());
                                  },
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          if (backButton)
            Positioned(
                top: 30,
                left: 0,
                child: SizedBox(
                  width: context.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      backButtonChild ?? QCBackButton(),
                      Spacer(),
                      if (action != null) action!,
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}
