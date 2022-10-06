import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

class MoneySavedInfo extends StatelessWidget {
  MoneySavedInfo({Key? key}) : super(key: key);

  UserStatusController _userState = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('TotalSave'),
                Obx(() => Text(
                    '${_userState.moneyViewer(_userState.collectedData, type: _userState.totalSmokeFreeTime['days'])}'))
              ],
            ),
            Column(
              children: [
                Text('Weekly Save'),
                Obx(() => Text(
                    '${_userState.moneyViewer(_userState.collectedData, type: 7)}'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
