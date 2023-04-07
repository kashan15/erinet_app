import '../controller/login_controller.dart';
import '../utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../components/pin_text_field.dart';
import '../utils/colors_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class OtpScreen extends GetView<LoginController> {
  const OtpScreen({Key? key}) : super(key: key);

  // final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeW(30), vertical: sizeH(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                //   child: SizedBox.square(
                //       dimension: sizeW(40),
                //       child: MyBox(
                //         color: primaryColorSwatch.shade100,
                //         radius: 7,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: genericAsset(
                //             asset: Assets.backIcon,
                //             iconColor: primaryColorSwatch,
                //           ),
                //         ),
                //       )),
                // ),
                height(20),
                Align(alignment: Alignment.topRight, child: instruction()),
                height(40),
                Text(
                  fillCodeSUtil,
                  style: med18.copyWith(color: primaryColorSwatch),
                ),
                height(20),
               Obx(()=> Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PinTextField(controller.fieldOne, true,
                            focusNode: controller.focusNode1,hasFocus: controller.isFocus1.value), // auto focus
                        PinTextField(controller.fieldTwo, false,
                            focusNode: controller.focusNode2,hasFocus: controller.isFocus2.value),
                        PinTextField(controller.fieldThree, false,
                            focusNode: controller.focusNode3,hasFocus: controller.isFocus3.value),
                        PinTextField(controller.fieldFour, false,
                            focusNode: controller.focusNode4,hasFocus: controller.isFocus4.value)
                      ],
                  ),
               ),
                height(130),
                Text(
                  noOtpSUtil,
                  style: med12.copyWith(
                      color: primaryColorSwatch,
                      decoration: TextDecoration.underline),
                ),
                Button(
                  width: Get.width,
                  text: submitSUtil,
                  onPressed: controller.onOtpSubmit ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget instruction() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        MyBox(
            color: primaryColorSwatch,
            radius: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeW(25), vertical: sizeW(15)),
              child: Text(
                otpInstructionSUtil,
                style: med12.copyWith(color: textWhiteColor),
              ),
            )),
        Positioned(
          top: -sizeH(20),
          left: -sizeW(20),
          child: SizedBox.square(
              dimension: sizeW(40),
              child: const MyBox(
                color: greenColor,
                radius: 7,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
