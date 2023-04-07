import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/recharge_controller.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class BankTransferProofScreen extends GetView<RechargeController> {
  const BankTransferProofScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
        child: Obx(
          () => Column(
            children: [
              _header(),
              height(20),
              _screenShot(),
              height(15),
              Button(
                text: 'Upload Screenshot',
                onPressed: () => controller.getPickerType(),
              ),

              height(15),
              controller.image.value.path.isEmpty ? const SizedBox():Button(
                text: 'Proceed',
                onPressed: () => controller.onProceed(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        SizedBox.square(
            dimension: sizeW(40),
            child: MyBox(
              color: primaryColorSwatch.shade100,
              radius: 7,
              child: const Icon(
                Icons.wallet_outlined,
                color: primaryColorSwatch,
              ),
            )),
        height(10),
        Text(
            "Congratulations! You have successfully recharged \$40 from airtel. Enjoy your seamless communication experience.",
            style: med14.copyWith(color: textBlackColor),
            maxLines: 5,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis),
      ],
    );
  }

  Widget _screenShot() {
    return controller.image.value.path.isEmpty ? const SizedBox():Container(
        decoration: BoxDecoration(border: Border.all(color: textGreyColor)),
        height: sizeH(400),
        child: Image.file(
          File(controller.image.value.path),
          fit: BoxFit.contain,
        ));
  }
}
