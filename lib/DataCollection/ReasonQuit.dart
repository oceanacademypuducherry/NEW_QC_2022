import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/DataCollectionTitle.dart';
import 'package:new_qc/CommonWidgets/NextButton.dart';
import 'package:new_qc/CommonWidgets/QCChip.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/Dashboard/Dashboard.dart';
import 'package:new_qc/Get_X_Controller/API_Controller.dart';
import 'package:new_qc/Get_X_Controller/BottomNavController.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:new_qc/Get_X_Controller/HealthImprovementController.dart';
import 'package:new_qc/Get_X_Controller/JournalController.dart';
import 'package:new_qc/Get_X_Controller/Loading_contoller.dart';
import 'package:new_qc/Get_X_Controller/MissionController.dart';
import 'package:new_qc/Get_X_Controller/UserStatusController.dart';
import 'package:new_qc/Get_X_Controller/cravings_controller.dart';
import 'package:new_qc/main.dart';

class ReasonQuit extends StatelessWidget {
  ReasonQuit({Key? key}) : super(key: key);

  GetStorage storage = GetStorage();
  DataCollectionController _dcc = Get.find<DataCollectionController>();
  APIController apiController = Get.find<APIController>();
  UserStatusController userStatus = Get.find<UserStatusController>();
  LoadingController loadingController = Get.find<LoadingController>();
  List<String> reasons = [
    "Freedom",
    "Health",
    "Children",
    "Stink",
    "Fitness",
    "Pregnant",
    "Environment",
    "Childbearing",
    "Money",
    "Appearance",
    "Accountability"
  ];
  List<Widget> reasonsChips() {
    List<Widget> reasonList = [];
    for (String i in reasons) {
      reasonList.add(QCChip(
        label: i,
      ));
    }
    return reasonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundContainer(
          isDashboard: false,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/family.png',
                    colorBlendMode: BlendMode.multiply,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                Column(
                  children: [
                    DataCollectionTitle(
                      title: "Reason for Quit?",
                      subtitle: "Choose your personal motives here",
                      hasSubtitle: true,
                    ),
                    Wrap(
                      children: [...reasonsChips()],
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NextButton(
                      color: Colors.white38,
                      isBorder: false,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      onPressed: () async {
                        //TODO: getx Storage

                        _dcc.addReasonList(QCChip.reasonList);
                        OverlayEntry loading =
                            await loadingController.overlayLoading();
                        // ignore: use_build_context_synchronously
                        Overlay.of(context)!.insert(loading);

                        await apiController.addDatacollection(data: {
                          "quiteDate": _dcc.quiteDate.value,
                          "cigaretteInfo": _dcc.cigaretteInfo.value,
                          "reasonList": _dcc.reasonList.value
                        });

                        userStatus.readSessionData();
                        loading.remove();

                        Get.to(() => Dashboard(),
                            transition: Transition.rightToLeft,
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: QCColors.inputTextColor,
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
