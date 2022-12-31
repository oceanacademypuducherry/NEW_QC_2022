import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class APIController extends GetxController {
  GetStorage storage = GetStorage();
  final userEmail = "".obs;
  final username = "".obs;
  final userInfo = {}.obs;
  final isBackup = true.obs;

  /// Login user

  signUp({email, password, uname}) async {
    try {
      var response =
          await Dio().post('https://qc-sfm.herokuapp.com/user/signup', data: {
        "email": email.toString(),
        "username": uname.toString(),
        "password": password.toString()
      });
      print("================Success==================");
      print(response);
      userInfo({"username": uname.toString(), "email": email.toString()});
      userEmail(email.toString());
      username(uname.toString());
      await storage.write("userData", {
        "username": uname.toString(),
        "email": email.toString(),
        "userInfo": {"username": uname.toString(), "email": email.toString()}
      });
      await storage.write("email", email.toString());
      await storage.write("username", uname.toString());
      await storage.write("isLogged", true);
      await storage.write("isPending", true);

      print("================Success==================");
    } catch (e) {
      print("================ERROR==================");
      print(e);
      Get.snackbar(
        'Error',
        "something went wrong or Make sure your internet connection",
        isDismissible: true,
      );
      print("================ERROR==================");
    }
  }

  login({email, password}) async {
    try {
      var res = await Dio().post('https://qc-sfm.herokuapp.com/user/login',
          data: {'email': email, 'password': password});
      print("================Success==================");
      dynamic data = res.data;
      userInfo(data);
      userEmail(data['email']);
      username(data['username']);

      storage.write('userData', data);
      storage.write("isLogged", true);

      print("================Success==================");
    } catch (e) {
      print("================ERROR==================");
      print(e);
      Get.snackbar(
        'Error',
        "something went wrong or Make sure your internet connection",
        isDismissible: true,
      );
      print("================ERROR==================");
    }
  }

  addDatacollection({Map data = const {}}) async {
    try {
      ///todo  fix api issue then un command it
      // print('==========');
      // Map userData = await storage.read('userData');
      //
      // var res = await Dio().post(
      //     'https://qc-sfm.herokuapp.com/user/set/data_collection',
      //     data: {"email": userData['email'], "data": data});
      // print("================Success==================");
      // Map resData = res.data;
      // print(resData);
      //
      print('----------------------------||||||||||||||||||||');
      // await storage.write('userData', resData);
      ///todo  fix api issue then un command it
      await storage.write('userData', data);
      await storage.write("isLogged", true);
      await storage.write("isPending", false);

      final testDat = await storage.read('userData');
      print('=====$testDat=====');
      print("================Success==================");
    } catch (e) {
      print("================ERROR==================");
      print(e);
      print("================ERROR==================");
    }
  }

  backupAction() async {
    dynamic checkBackup = await storage.read('isBackup');
    DateTime currentDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (checkBackup != null) {
      DateTime lastBackupDate = DateTime.parse(checkBackup);
      print(lastBackupDate);
      print(currentDate);
      isBackup(currentDate == lastBackupDate);
    } else {
      await storage.write("isBackup", currentDate.toString());
    }

    if (isBackup.value == false) {
      print('backup try..................');
      setBackup();
    } else {
      print('backup already taken..................');
    }
  }

  setBackup() async {
    dynamic userData = await storage.read('userData');
    try {
      print(userData['email']);
      if (userData != null) {
        await Dio().post('https://qc-sfm.herokuapp.com/user/set/backup',
            data: {"email": userData['email'], "data": userData});

        print('backup Completed.....');
      } else {
        print('Something went Wrong');
      }
    } catch (e) {
      print(e);
    }
  }
}
