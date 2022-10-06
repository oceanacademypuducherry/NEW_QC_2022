import 'package:get/get.dart';

class DataCollectionController extends GetxController {
  final userInfo = {}.obs;
  final quiteDate = "${DateTime.now()}".obs;
  final cigaretteInfo = <String, int>{
    "dayOfCigarettes": 1,
    "packOfCigarettes": 10,
    "boxOfCost": 180,
    "addictionOfYears": 0
  }.obs;
  final reasonList = [].obs;

  void addUserInfo(Map<String, dynamic> data) {
    userInfo(data);
  }

  void addQuitDate(String pickedDate) {
    quiteDate(pickedDate);
  }

  void addCigaretteInfo(Map<String, int> info) {
    cigaretteInfo(info);
  }

  void addReasonList(List<String> reasons) {
    reasonList(reasons);
  }

  //its not use yet
  void updateReasonList(String reason, [bool isAdd = true]) {
    if (isAdd) {
      reasonList.add(reason);
    } else {
      reasonList.remove(reason);
    }
  }
}
