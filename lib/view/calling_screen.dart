import 'package:flutter/foundation.dart';

import '../components/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calling_controller.dart';

class CallingScreen extends GetView<CallingController> {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Container(
            color: Colors.blue,
            height: sizeH(70),
            child: /*GetBuilder<CallingController>(
              builder: (controller) {
                return */
                Obx(
              () => /*child: */ Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*Positioned(
                        top: controller.declineButtonY.value,
                        left: controller.declineButtonY.value,
                        child: circleAvatar(
                            asset: Icons.call_end_outlined,
                            size: sizeH(70),
                            bgColor: Colors.red,
                            shadow: false,
                            iconColor: Colors.white),
                      ),*/
                  Positioned(
                      top: controller.acceptButtonY.value,
                      right: controller.acceptButtonX.value,
                      child: SizedBox(
                          child: controller.showButton.value == true
                              ? GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    controller.acceptButtonX.value -=
                                        details.delta.dx;


                                    if (kDebugMode) {
                                      print(
                                        "paning  :: ${details.delta.dx} ::: ${sizeH(30)}  :::: ${controller.acceptButtonX.value.toString()}");
                                    }
                                    // Swiping in right direction.
                                    /*if (details.delta.dx > 0) {
                                      print("Attending");
                                    }
                                    if (details.delta.dx < 0) {
                                      print(
                                          "declining  :: ${details.delta.dx} ::: ${sizeW(30).toString()} ");
                                      // controller.acceptButtonX.value -=
                                      //     details.delta.dx;
                                    }

                                    if (details.delta.dx == sizeW(30)) {
                                      controller.showButton.value = false;
                                    }*/
                                  },
                                  onHorizontalDragEnd: (_) {
                                    // controller.acceptButtonX.value = sizeW(30);
                                  },
                                  child: circleAvatar(
                                      asset: Icons.call_outlined,
                                      size: sizeH(70),
                                      shadow: false,
                                      bgColor: Colors.green,
                                      iconColor: Colors.white),
                                )
                              : null)),
                ],
              ),
            ),
            //   }
            // ),
          ),
        ),
      ),
    );
  }
}
