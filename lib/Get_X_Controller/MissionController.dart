import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MissionController extends GetxController {
  GetStorage storage = GetStorage();
  final missionData = [].obs;

  loadMissionData() async {
    List m_Data = await storage.read('missions') ?? [];

    bool dataCheck = m_Data.length == missionDataList.length;

    if (dataCheck) {
      missionData(m_Data);
    } else {
      missionData(missionDataList);
      storage.write('missions', missionDataList);
    }
  }

  missionUpdate(missionIndex, data) async {
    missionData[missionIndex] = data;
    await storage.write('mission', missionData);
    Get.snackbar("Mission Completed", data['title']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMissionData();
  }
}

List<Map> missionDataList = [
  {
    "openDay": 1,
    "isComplete": false,
    "missionVector": "assets/images/mission/plant.svg",
    "title": "Plant a Tree Today",
    "description":
        "To plant trees is to give body and life to one's dreams of a better world.",
    "comments": "",
  },
  {
    "openDay": 2,
    "isComplete": false,
    "missionVector": "assets/images/mission/plant.svg",
    "title": "Plant a Tree Today",
    "description":
        "To plant trees is to give body and life to one's dreams of a better world.",
    "comments": "",
  },
  {
    "openDay": 3,
    "isComplete": false,
    "missionVector": "assets/images/mission/plant.svg",
    "title": "Plant a Tree Today",
    "description":
        "To plant trees is to give body and life to one's dreams of a better world.",
    "comments": "",
  }
];
