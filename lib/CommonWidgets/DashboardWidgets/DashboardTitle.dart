import 'package:flutter/material.dart';

class DashboardTitle extends StatelessWidget {
  DashboardTitle({Key? key, this.title = "Title"}) : super(key: key);

  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
          ),
          Divider(
            thickness: 3,
            color: Color(0xff60B9B4),
            endIndent: MediaQuery.of(context).size.width / 2.6,
            indent: MediaQuery.of(context).size.width / 2.6,
          )
        ],
      ),
    );
  }
}
