import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:new_qc/CommonWidgets/DataCollectionTitle.dart';
import 'package:new_qc/CommonWidgets/NextButton.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:new_qc/DataCollection/CigaretteInfo.dart';
import 'package:new_qc/Get_X_Controller/DataCollectionController.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class QuitDatePicker extends StatelessWidget {
  QuitDatePicker({Key? key}) : super(key: key);
  DataCollectionController _dcc = Get.find<DataCollectionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              DataCollectionTitle(
                title: "When Your Plan to Start Your Quit Journey?",
                hasSubtitle: true,
                subtitle: "Choose Your Desire Date here",
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white38,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SfDateRangePicker(
                      toggleDaySelection: false,
                      onSelectionChanged: (val) {
                        DateTime dd = DateTime.parse(val.value.toString());
                        DateTime timing = DateTime.now();
                        DateTime quiteDate = DateTime(dd.year, dd.month, dd.day,
                            timing.hour, timing.minute, timing.second);
                        print(quiteDate); //TODO: store getx Storage

                        _dcc.addQuitDate(quiteDate.toString());
                      },
                      maxDate: DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day + 7),
                      todayHighlightColor: QCColors.inputTextColor,
                      selectionColor: QCColors.inputTextColor,
                      backgroundColor: Colors.white38,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NextButton(
                    color: Colors.white38,
                    isBorder: false,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    onPressed: () {
                      print(_dcc.quiteDate);
                      Get.to(() => CigaretteInfo(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
