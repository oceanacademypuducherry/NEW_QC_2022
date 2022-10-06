import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/Dashboard/Dashboard.dart';
import 'package:new_qc/DataCollection/Login.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:new_qc/Get_X_Controller/HealthImprovementController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';

void main() async {
  await GetStorage.init();
  Get.put(DataCollectionController());
  Get.put(UserStatusController());
  Get.put(HealthImprovementController());
  runApp(MainRun());
}

class MainRun extends StatelessWidget {
  MainRun({Key? key}) : super(key: key);

  GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    print(storage.getKeys());
    print('&&&&&&&&&&&&&&&');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: storage.read('isLogged') != null
          ? storage.read('isLogged')
              ? Dashboard()
              : Login()
          : Login(),
    );
  }
}
