import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStatusController extends GetxController {
  GetStorage storage = GetStorage();
  final timer = true.obs;
  final collectedData = {}.obs;
  final smokeFreeTime = {}.obs;
  final totalSmokeFreeTime = {
    'years': 0,
    'months': 0,
    'days': 0,
    'hours': 0,
    'minutes': 0,
    'seconds': 0
  }.obs;
  final showTimes = <Map<String, dynamic>>[
    {"value": 0, "key": "hours"},
    {"value": 0, "key": "minutes"},
    {"value": 0, "key": "seconds"}
  ].obs;

  // Todo: health improvement variables
  final healthImprovements = <Map>[].obs;

  void timeCounter(String quitDate) {
    DateTime currentDate = DateTime.parse("${DateTime.now()}");
    dynamic value = currentDate.difference(DateTime.parse(quitDate)).inSeconds;

    updateFunction(value);
    smokeFreeTimeConvert();
    addHealthImprovements(value <= 0 ? 0 : value);

    // print(healthImprovements);
  }

  updateFunction(int totalSeconds) {
    int seconds = totalSeconds % 60;
    int totalMinutes = totalSeconds ~/ 60;
    int minutes = totalMinutes % 60;
    int totalHours = totalMinutes ~/ 60;
    int hours = totalHours % 24;
    int totalDays = totalHours ~/ 24;
    int days = totalDays % 30;
    int totalMonth = totalDays ~/ 30;
    int months = totalMonth % 12;
    int years = totalMonth ~/ 12;

    // print('Date: $years/$months/$days\nTime$hours:$minutes:$seconds');
    Map<String, int> times = {
      "isStarted": totalSeconds <= 0 ? 0 : 1,
      'years': years,
      'months': months,
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds
    };
    Map<String, int> totalTimes = {
      'years': years,
      'months': totalMonth,
      'days': totalDays,
      'hours': totalHours,
      'minutes': totalMinutes,
      'seconds': totalSeconds
    };
    totalSmokeFreeTime(totalTimes);
    smokeFreeTime(times);
  }

  startTimer(String quitDate) {
    Timer.periodic(
      const Duration(seconds: 1),
      (tim) {
        // print(tim);
        // print(tim.runtimeType);
        if (timer.value) {
          return timeCounter(quitDate);
        } else {
          return tim.cancel();
        }
      },
    );
  }

  void readSessionData() async {
    stopTimer(runTimer: true);
    dynamic data = await storage.read("collectedData");

    if (data != null) {
      startTimer(data["quiteDate"]);
      collectedData(data);
    }
  }

  void stopTimer({runTimer: true}) {
    timer(runTimer);
  }

  void smokeFreeTimeConvert() {
    final sft = smokeFreeTime;
    if (sft['years'] != 0) {
      showTimes([
        {"value": sft['years'], "key": "years"},
        {"value": sft['months'], "key": "months"},
        {"value": sft['days'], "key": "days"}
      ]);
    } else if (sft['years'] < 1 && sft['months'] > 0) {
      showTimes([
        {"value": sft['months'], "key": "months"},
        {"value": sft['days'], "key": "days"},
        {"value": sft['hours'], "key": "hours"}
      ]);
    } else if (sft['days'] > 0) {
      showTimes([
        {"value": sft['days'], "key": "days"},
        {"value": sft['hours'], "key": "hours"},
        {"value": sft['minutes'], "key": "minutes"},
      ]);
    } else {
      showTimes([
        {"value": sft['hours'], "key": "hours"},
        {"value": sft['minutes'], "key": "minutes"},
        {"value": sft['seconds'], "key": "seconds"}
      ]);
    }
  }

  //TODO: health Improvements

  void addHealthImprovements(int totalSeconds) {
    int totalMinutes = totalSeconds ~/ 60;
    int totalHours = totalMinutes ~/ 60;
    int totalDays = totalHours ~/ 24;

    List<Map> healthData = [
      {
        'title': 'Pules Rate',
        'calculationTime': 20,
        'totalMinutesOrDays': totalMinutes,
        'isFinish': 20 < totalMinutes,
        'description': '20 Minutes',
      },
      {
        'title': 'Oxygen Level',
        'calculationTime': 480,
        'totalMinutesOrDays': totalMinutes,
        'isFinish': 480 < totalMinutes,
        'description': '8 Hours',
      },
      {
        'title': 'Carbon monoxide level',
        'calculationTime': 1440,
        'totalMinutesOrDays': totalMinutes,
        'isFinish': 1440 < totalMinutes,
        'description': '24 Hours'
      },
      {
        'title': 'Nicotine expelled from body',
        'calculationTime': 2520,
        'totalMinutesOrDays': totalMinutes,
        'isFinish': 2520 < totalMinutes,
        'description': '42 Hours'
      },
      {
        'title': 'Taste and smell',
        'calculationTime': 14400,
        'totalMinutesOrDays': totalMinutes,
        'isFinish': 14400 < totalMinutes,
        'description': '10 Days'
      },
      {
        'title': 'Breathing',
        'calculationTime': 120960,
        'totalMinutesOrDays': totalMinutes,
        'isFinish': 120960 < totalMinutes,
        'description': '12 Weeks'
      },
      {
        'title': 'Energy levels',
        'calculationTime': 273,
        'totalMinutesOrDays': totalDays,
        'isFinish': 273 < totalDays,
        'description': '9 Months'
      },
      {
        'title': 'Bed Breath',
        'calculationTime': 365,
        'totalMinutesOrDays': totalDays,
        'isFinish': 365 < totalDays,
        'description': '1 Years'
      },
      {
        'title': 'Tooth Stationing',
        'calculationTime': 1825,
        'totalMinutesOrDays': totalDays,
        'isFinish': 1825 < totalDays,
        'description': '5 Years'
      },
      {
        'title': 'Cums and Teeth',
        'calculationTime': 3650,
        'totalMinutesOrDays': totalDays,
        'isFinish': 3650 < totalDays,
        'description': '10 Years'
      },
      {
        'title': 'Circulation',
        'calculationTime': 5475,
        'totalMinutesOrDays': totalDays,
        'isFinish': 5475 < totalDays,
        'description': '15 Years'
      },
      {
        'title': 'Gum texture',
        'calculationTime': 7300,
        'totalMinutesOrDays': totalDays,
        'isFinish': 7300 < totalDays,
        'description': '20 Years'
      },
    ];

    healthImprovements(healthData);
  }

  List<Map> healthState() {
    List<Map> count = [];
    for (int i = 0; i < healthImprovements.length; i++) {
      Map data = healthImprovements[i];
      if (!data['isFinish']) {
        dynamic progres =
            ((data['totalMinutesOrDays'] * 100) / data['calculationTime']);
        data['progress'] = progres;
      }
    }
    return count;
  }

  //ToDO:money saved

  num moneyViewer(collectedData, {type: 1}) {
    Map mc = collectedData['cigaretteInfo'];

    num savedMoney =
        mc['boxOfCost'] / mc['packOfCigarettes'] * mc['dayOfCigarettes'];
    return savedMoney * type;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readSessionData();
  }
}