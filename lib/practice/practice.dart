import 'package:flutter/material.dart';
import 'package:SFM/Dashboard/Achievements.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Achievements(),
          GestureDetector(
            child: Text('data'),
            onTap: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
