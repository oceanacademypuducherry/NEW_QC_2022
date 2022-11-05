import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/NextButton.dart';
import 'package:new_qc/CommonWidgets/NormalButton.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/CommonWidgets/TextInput.dart';
import 'package:new_qc/Dashboard/Dashboard.dart';
import 'package:new_qc/DataCollection/QuitDate.dart';
import 'package:new_qc/DataCollection/Signup.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  DataCollectionController _dcc = Get.find<DataCollectionController>();
  UserStatusController userStatus = Get.find<UserStatusController>();

  bool _emailValidate = true;

  bool _passwordValidate = true;

  GetStorage storage = GetStorage();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;

    print(screenSize.width);
    print(isKeyBoard);
    if (isKeyBoard) {}
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
        child: BackgroundContainer(
            isDashboard: false,
            child: Container(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      height: screenSize.height / 1.05,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.asset(
                                'assets/images/hill.png',
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextInput(
                                    controller: _emailController,
                                    hintText: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                    isValidate: _emailValidate,
                                  ),
                                  SizedBox(height: 15),
                                  TextInput(
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    showIcon: true,
                                    isPassword: true,
                                    isValidate: _passwordValidate,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                                color:
                                                    QCColors.secondaryTexColor),
                                          ))
                                    ],
                                  ),
                                  NormalButton(
                                    buttonName: "Login",
                                    onPressed: () async {
                                      if (_emailController.text.isEmail) {
                                        _emailValidate = true;
                                        //TODO: check password from DB
                                        if (_passwordController.text.length <
                                            6) {
                                          setState(() {
                                            _passwordValidate = false;
                                          });
                                          return;
                                        }

                                        //TODO: conntect getxStorage
                                        Map<String, dynamic> userData = {
                                          "name": 'username',
                                          "email": _emailController.text
                                        };

                                        _dcc.addUserInfo(userData);

                                        userStatus.stopTimer(runTimer: true);
                                        userStatus.readSessionData();
                                        await storage.write("isLogged", true);

                                        Get.to(() => Dashboard(),
                                            transition: Transition.rightToLeft,
                                            curve: Curves.easeInOut);
                                      } else {
                                        setState(() {
                                          _emailValidate = false;
                                        });
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 10,
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      Colors.white10,
                                      Colors.white70,
                                      Colors.white10
                                    ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        NextButton(
                                          child: Image.asset(
                                            'assets/images/oauth/g.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        NextButton(
                                          child: Image.asset(
                                            'assets/images/oauth/apple.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        NextButton(
                                          child: Image.asset(
                                            'assets/images/oauth/fb.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          Get.to(() => Signup(),
                                              transition:
                                                  Transition.leftToRight,
                                              curve: Curves.easeInOut);
                                        },
                                        splashColor: Colors.white30,
                                        colorBrightness: Brightness.light,
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "Not a Member?   ",
                                                style: TextStyle(
                                                    color: QCColors
                                                        .secondaryTexColor)),
                                            TextSpan(
                                              text: 'Register Now',
                                              style: TextStyle(
                                                  color:
                                                      QCColors.inputTextColor),
                                            )
                                          ]),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      )),
    );
  }
}
