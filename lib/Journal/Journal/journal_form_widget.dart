import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:SFM/CommonWidgets/QC_Colors.dart';
import 'package:SFM/Get_X_Controller/JournalController.dart';
import 'package:SFM/Journal/Journal/textfield.dart';

import 'package:velocity_x/velocity_x.dart';

class JournalFormWidget extends StatelessWidget {
  JournalFormWidget({
    Key? key,
    this.title1 = 'I am grateful for',
    this.title2 = 'Who  will I uplift today and how will i do so?',
    this.title3 = 'How can i improve the environment today?',
    this.isMorning = true,
  }) : super(key: key);
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  String title1;
  String title2;
  String title3;
  bool isMorning = true;

  final getStorage = GetStorage();
  JournalController _journalController = Get.find<JournalController>();
  clearField() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: context.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              label: title1,
              hintText: 'Write here',
              controller: controller1,
              hasIcon: false,
              autofocus: false,
              maxLines: 3,
            ),
            CustomTextField(
              label: title2,
              hintText: 'Write here',
              controller: controller2,
              hasIcon: false,
              autofocus: false,
              maxLines: 3,
            ),
            CustomTextField(
              label: title3,
              hintText: 'Write here',
              controller: controller3,
              hasIcon: false,
              autofocus: false,
              maxLines: 3,
            ),
            SizedBox(
              width: context.screenWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Material(
                  color: Colors.white.withOpacity(0.3),
                  child: 'Save'
                      .text
                      .color(QCColors.chipSelectedBg)
                      .bold
                      .makeCentered()
                      .box
                      .height(50)
                      .makeCentered()
                      .onInkTap(() {
                    if (controller1.text.isNotEmpty ||
                        controller2.text.isNotEmpty ||
                        controller3.text.isNotEmpty) {
                      DateTime date = DateTime.now();

                      Map journalData = {
                        "updateDate": "${date.day}-${date.month}-${date.year}",
                        "isMorning": isMorning,
                        'title1': controller1.text,
                        'title2': controller2.text,
                        'title3': controller3.text,
                      };
                      _journalController.addJournal(journalData);
                      clearField();
                    } else {
                      print(MediaQuery.of(context).viewInsets.bottom);
                      VxToast.show(context, msg: 'Field is Empty');
                    }
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
