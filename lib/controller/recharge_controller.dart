import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/custom_buttons.dart';
import '../components/custom_widgets.dart';
import '../components/new_custom_dialog.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';
import '../utils/colors_utils.dart';
import '../utils/route_utils.dart';

class RechargeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //image picker
  late Rx<File> image = File('').obs;
  final _picker = ImagePicker();

  onProceed() {
    Get.dialog(
      AlertOverlay(
        icon: Icons.notifications_none,
        primaryLabel: okSUtil,
        primaryTap: () =>
            [Get.back(), Get.offAndToNamed(kMyNotificationScreen)],
        label: agentWillConnectSUtil,
      ),
      // onPressed: ()=> Get.toNamed(kChatScreen),
    );
  }

  getPickerType() {
    Get.bottomSheet(

      isScrollControlled: true,
      Container(
        height: sizeH(200),
        // color: customWhiteColor, //specify your height here
        padding: EdgeInsets.symmetric(horizontal: sizeW(15)),

        decoration: BoxDecoration(
            color: Colors.grey.shade200, //textFieldColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.purple, //customGreyColor.withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(0, 3))
            ],
            border: Border.all(color: Colors.transparent, width: 1),
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(sizeW(40)))),

        child: Column(
          children: [
            SizedBox(height: sizeH(20)),
            Text(
              "${uploadImageFromSUtil.tr} :",
              style:
                  med18.copyWith(color: Colors.black87), // customPrimaryColor),
            ),
            // SizedBox(height: sizeH(30)),
            // SizedBox(height: sizeH(30)),

            SizedBox(height: sizeH(15)),
//apply filters
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
              child: Button(
                  color: accentColorSwatch,
                  text: cameraSUtil.tr,
                  onPressed: () => getImage(
                      ImageSource.camera) //(){},// controller.onFilterTap,
                  ),
            ),
            SizedBox(height: sizeH(10)),
            //apply filters
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
              child: Button(
                  color: accentColorSwatch,
                  text: gallerySUtil.tr,
                  onPressed: () => getImage(
                      ImageSource.gallery) //(){},// controller.onFilterTap,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  getImage(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(
        requestFullMetadata: false, source: imageSource);
    if (pickedFile != null) {
      Get.back();
    }

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      // imagePath = pickedFile.path;

      if (kDebugMode) {
        print('imagePath:  $image ||');
      }
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
}
