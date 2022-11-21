import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_qc/CommonWidgets/BackgroundContainer.dart';
import 'package:velocity_x/velocity_x.dart';

class NewMeditationPlayer extends StatefulWidget {
  NewMeditationPlayer({Key? key}) : super(key: key);

  String musicPath = "sounds/happy.mp3";

  @override
  State<NewMeditationPlayer> createState() => _NewMeditationPlayerState();
}

class _NewMeditationPlayerState extends State<NewMeditationPlayer> {
  Duration duration = Duration(seconds: 0);

  bool isPlay = false;
  AudioPlayer audioPlayer = AudioPlayer();

  bool isAmbient = false;
  int meditateDuration = 1;
  late Timer timer;
  dynamic timerFunction() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      int totalSec = duration.inSeconds;

      if (isPlay && totalSec > 0) {
        totalSec--;
        setState(() {
          duration = Duration(seconds: totalSec);
        });
      } else {
        timer.cancel();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    Size sr = context.screenSize;
    return Scaffold(
      body: BackgroundContainer(
        backButton: true,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Happiness"
                  .text
                  .size(sr.width / 13)
                  .color(Colors.black45)
                  .fontFamily("Gugi")
                  .make(),
              Container(
                margin: EdgeInsets.symmetric(vertical: sr.height / 20),
                height: sr.width / 2,
                width: sr.width / 2,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(sr.width / 2)),
                child: IconButton(
                  icon: Icon(isPlay ? Icons.pause : Icons.play_arrow_rounded),
                  iconSize: sr.width / 5,
                  color: Colors.black45,
                  onPressed: () {
                    if (!isPlay) {
                      audioPlayer.play(AssetSource(widget.musicPath));
                      audioPlayer.setReleaseMode(ReleaseMode.loop);
                      timerFunction();
                    }
                    setState(() {
                      isPlay = !isPlay;
                    });
                  },
                ),
              ),
              HStack([
                Opacity(
                  opacity: isPlay ? 0.2 : 1,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.minus),
                    iconSize: sr.width / 15,
                    color: Colors.black45,
                    onPressed: !isPlay
                        ? () {
                            int du = duration.inMinutes;
                            if (du > 1) {
                              du -= 1;
                              setState(() {
                                duration = Duration(minutes: du);
                              });
                            } else {
                              VxToast.show(context, msg: "Minimum 1");
                            }
                          }
                        : null,
                  ),
                ),
                "${duration.inMinutes <= 9 ? "0" : ""}${duration.inMinutes}:${duration.inSeconds % 60 <= 9 ? "0" : ""}${duration.inSeconds % 60}"
                    .text
                    .size(20)
                    .color(Colors.black45)
                    .bold
                    .make(),
                Opacity(
                  opacity: isPlay ? 0.2 : 1,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.plus),
                    iconSize: sr.width / 15,
                    color: Colors.black45,
                    onPressed: !isPlay
                        ? () {
                            int du = duration.inMinutes;
                            if (du < 10) {
                              du += 1;
                              setState(() {
                                duration = Duration(minutes: du);
                              });
                            } else {
                              VxToast.show(context, msg: "Maximum 10");
                            }
                          }
                        : null,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
