import 'package:flutter/material.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/practice/particuls.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Particuls();
    return Scaffold(
      body: BackgroundContainer(
        isDashboard: true,
        child: Container(
          child: Center(
            child: Text("More"),
          ),
        ),
      ),
    );
  }
}
