import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/NextButton.dart';
import 'package:new_qc/CommonWidgets/NormalButton.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/CommonWidgets/TextInput.dart';
import 'package:new_qc/DataCollection/Login.dart';
import 'package:new_qc/DataCollection/QuitDate.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _usernameController = TextEditingController();

  DataCollectionController _dcc = Get.find<DataCollectionController>();

  bool _nameValidate = true;

  bool _emailValidate = true;

  bool _passwordValidate = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: BackgroundContainer(
          isDashboard: false,
          child: Center(
            child: ListView(
              children: [
                Container(
                  height: screenHeight / 1.05,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Image.asset(
                          'assets/images/hill.png',
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextInput(
                                hintText: 'Name',
                                controller: _usernameController,
                                isValidate: _nameValidate,
                              ),
                              TextInput(
                                hintText: 'Email',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                isValidate: _emailValidate,
                              ),
                              TextInput(
                                hintText: 'Password',
                                controller: _passwordController,
                                isPassword: true,
                                showIcon: true,
                                isValidate: _passwordValidate,
                              ),
                              SizedBox(),
                              NormalButton(
                                buttonName: "SignUp",
                                onPressed: () {
                                  if (_emailController.text.isEmail) {
                                    _emailValidate = true;
                                    //TODO: check password from DB
                                    print(_usernameController.text.length < 3);
                                    if (_usernameController.text.length < 3) {
                                      setState(() {
                                        _nameValidate = false;
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        _nameValidate = true;
                                      });
                                    }

                                    if (_passwordController.text.length < 6) {
                                      setState(() {
                                        _passwordValidate = false;
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        _passwordValidate = true;
                                      });
                                    }

                                    //TODO: conntect getxStorage
                                    Map<String, dynamic> userData = {
                                      "name": _usernameController.text,
                                      "email": _emailController.text
                                    };

                                    _dcc.addUserInfo(userData);

                                    Get.to(() => QuitDatePicker(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 10,
                                width: MediaQuery.of(context).size.width - 50,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NextButton(
                                      child: Image.asset(
                                        'assets/images/oauth/g.png',
                                        height: screenHeight / 25,
                                        width: screenHeight / 25,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    NextButton(
                                      child: Image.asset(
                                        'assets/images/oauth/apple.png',
                                        height: screenHeight / 25,
                                        width: screenHeight / 25,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    NextButton(
                                      child: Image.asset(
                                        'assets/images/oauth/fb.png',
                                        height: screenHeight / 25,
                                        width: screenHeight / 25,
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
                                      Get.to(Login(),
                                          transition: Transition.rightToLeft,
                                          curve: Curves.easeInOut);
                                    },
                                    splashColor: Colors.white30,
                                    colorBrightness: Brightness.light,
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Already have an account?   ",
                                            style: TextStyle(
                                                color: QCColors
                                                    .secondaryTexColor)),
                                        TextSpan(
                                          text: 'Login',
                                          style: TextStyle(
                                              color: QCColors.inputTextColor),
                                        )
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
