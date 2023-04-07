import 'package:erinet_app/controller/login_controller.dart';

import '../components/custom_buttons.dart';
import '../utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_widgets.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class UserTypeScreen extends GetView<LoginController> {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(30)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: heading(whoSUtil, areYouSUtil),
              ),
              height(15),
              _body(),
              height(120),
              Button(
                  text: nextSUtil,
                  width: Get.width,
                  onPressed: controller.onUserNext),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Obx(
      () => Column(
        children: [
          _userType(Assets.agent, agentSUtil, 1),
          _userType(Assets.user, userSUtil, 2),
        ],
      ),
    );
  }

  Widget _userType(String asset, text, int userType) {
    return GestureDetector(
      onTap: () => controller.onUserTap(userType),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeW(8.0), vertical: sizeH(8)),
        child: Column(
          children: [
            circleAvatar(
                asset: asset,
                size: sizeH(130),
                borderColor: userType == controller.userTypeId.value
                    ? accentColorSwatch
                    : textWhiteColor,
                border: true),// userType == controller.userTypeId.value),
            height(8),
            Button(
              width: sizeW(100),
              height: sizeH(30),
              text: text,
              textStyle: med14.copyWith(color: Colors.white),
              color: userType == controller.userTypeId.value
                  ? accentColorSwatch
                  : primaryColorSwatch,
            )
          ],
        ),
      ),
    );
  }
}
