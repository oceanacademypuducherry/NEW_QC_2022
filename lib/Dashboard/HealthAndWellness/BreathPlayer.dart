import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:new_qc/CommonWidgets/QC_Colors.dart';
import 'package:rive/rive.dart';
import 'package:velocity_x/velocity_x.dart';

class BreathPlayer extends StatefulWidget {
  BreathPlayer(
      {Key? key,
      this.srcPath = "assets/Rive/box_breath.riv",
      this.color = Colors.white,
      this.title = "title"})
      : super(key: key);

  Color color;
  String title;
  String srcPath;

  @override
  State<BreathPlayer> createState() => _BreathPlayerState();
}

class _BreathPlayerState extends State<BreathPlayer> {
  SMIInput<bool>? input;
  Artboard? artboard;

  animationInit() async {
    final data = await rootBundle.load(widget.srcPath);
    final file = RiveFile.import(data);
    artboard = file.mainArtboard;
    final controller = StateMachineController.fromArtboard(artboard!, "state");
    if (controller != null) {
      artboard!.addController(controller);
      input = controller.findInput<bool>('isPlay');
      input!.value = false;
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   animationInit();
  // }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await animationInit();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundContainer(
          backButton: true,
          child: Container(
            color: QCDashColor.odd,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  artboard != null
                      ? SizedBox(
                          width: context.screenWidth / 1.5,
                          height: context.screenWidth / 1.5,
                          child: Rive(artboard: artboard!))
                      : SizedBox(),

                  // SizedBox(
                  //   height: context.screenWidth / 1.3,
                  //   width: context.screenWidth / 1.3,
                  //   child: Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Container(
                  //         height: context.screenWidth / 1.5,
                  //         width: context.screenWidth / 1.5,
                  //         decoration: BoxDecoration(
                  //           color: color.withOpacity(0.2),
                  //           borderRadius: BorderRadius.circular(
                  //               context.screenWidth / 1.5),
                  //         ),
                  //       ),
                  //       Container(
                  //         height: context.screenWidth / 2,
                  //         width: context.screenWidth / 2,
                  //         decoration: BoxDecoration(
                  //           color: color.withOpacity(0.2),
                  //           borderRadius:
                  //               BorderRadius.circular(context.screenWidth / 2),
                  //         ),
                  //       ),
                  //       '3'.text.bold.size(50).color(color).make()
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  widget.title.text.size(20).color(Vx.gray600).bold.make(),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        input!.value = !input!.value;
                      });
                    },
                    child: Container(
                      width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: widget.color, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          "05:00".text.color(widget.color).bold.make(),
                          Spacer(),
                          Icon(
                            Icons.play_arrow_rounded,
                            color: widget.color,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
