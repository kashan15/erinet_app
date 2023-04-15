import 'package:erinet_app/components/custom_widgets.dart';
import 'package:erinet_app/utils/utils.dart';
import 'package:erinet_app/view/start_connecting_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class LiveCalling extends StatefulWidget {

  final String callingId;

   LiveCalling({Key? key,
     required this.callingId
   }) : super(key: key);

  @override
  State<LiveCalling> createState() => _LiveCallingState();
}

class _LiveCallingState extends State<LiveCalling> {

  bool mic = false;

  ZegoExpressEngine? engine;
  ZegoEngineProfile profile = new ZegoEngineProfile(
    1705018243,
    ZegoScenario.Default, // General scenario
    appSign: '0ff8679274cce78292ae930172eccd8e0587ee66169b54fafdf609daac6b1b38',
    enablePlatformView: true
  );





  callEnd() {
    engine?.logoutRoom();
  }

  micOnAndOff() {
    if (mic == true) {
      //engine!.enableAudio();
      engine!.enableAEC(mic);
    } else {
      //engine!.disableAudio();
      engine!.enableAEC(mic);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Stack(
                children: [
                  height(30),

                  Container(
                    color: Colors.black,

                  ),
                  Center(
                      child: Container(
                        color: Colors.black,
                        height: double.infinity,
                        width: double.infinity,
                      )
                    // model.renderRemoteVideo(),
                  ),

                  Positioned(
                    bottom: 15,
                    left: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        width(10),
                        InkWell(
                            onTap: () {
                              callEnd();
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.1,
                                height: MediaQuery.of(context).size.height*0.1,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.call_end,
                                  color: Colors.white,
                                ))),
                       width(25),
                        InkWell(
                          onTap: () {
                            micOnAndOff();
                            mic =! mic;

                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              height: MediaQuery.of(context).size.height*0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: Icon(
                                  mic ? Icons.mic_off : Icons.mic
                              )),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
