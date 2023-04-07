import 'dart:io';

import 'package:erinet_app/components/custom_buttons.dart';
import 'package:erinet_app/components/custom_widgets.dart';
import 'package:erinet_app/controller/login_controller.dart';
import 'package:erinet_app/utils/storage_utils.dart';
import 'package:erinet_app/utils/textStyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/string_utils.dart';

class ProfileController extends GetxController{


  double blockHeight = 1;
  double blockWidth = 1;

  RxInt defaultValue = 1.obs;
  RxString imagepath = ''.obs;
  RxString profilePicImg = ''.obs;
  RxString idFrontImg = ''.obs;
  RxString idBackImg = ''.obs;

  final GlobalKey<ScaffoldState> scaffoldKey  = GlobalKey<ScaffoldState>();

  final TextEditingController profileNameController = TextEditingController();

  final TextEditingController profileEmailController = TextEditingController();

  final TextEditingController profileMobileController = TextEditingController();

  final TextEditingController profileDobController = TextEditingController();

  final TextEditingController profileLocationController = TextEditingController();

  final TextEditingController profileIdController = TextEditingController();

  bool tap = false;

  // final ImagePicker imgpicker = ImagePicker();
  final _picker = ImagePicker();


  late Rx<File> image = File('').obs;

  // Future getImage() async {
  //   try {
  //     var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
  //
  //     if (pickedFile != null) {
  //       imagepath.value = pickedFile.path;
  //
  //     }
  //     else {
  //       print("No image is selected.");
  //     }
  //   }
  //
  //   catch (e) {
  //     print("error while picking image.");
  //   }
  // }



  getImage(String imgType, ImageSource source) async {
    final pickedFile = await _picker.pickImage(
        requestFullMetadata: false, source: source);

    if (pickedFile != null) {
      Get.back();
      image.value = File(pickedFile.path);
      // imagePath = pickedFile.path;

      if (kDebugMode) {
        print('imagePath:  ${image.value} ||');
      }

      update();
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  getPickerType(String imgType) {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: sizeH(200),
        // color: customWhiteColor, //specify your height here
        padding: EdgeInsets.symmetric(horizontal: sizeW(15)),

        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 3,
                  offset: const Offset(0, 3))
            ],
            border: Border.all(color: Colors.transparent, width: 1),
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(sizeW(40)))),

        child: Column(
          children: [
            SizedBox(height: sizeH(20)),
            Text(
              "${uploadImageFromSUtil.tr} :",
              style: med18.copyWith(color: Colors.white),
            ),
            // SizedBox(height: sizeH(30)),
            // SizedBox(height: sizeH(30)),

            SizedBox(height: sizeH(15)),
//apply filters
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
              child: Button(
                  text: cameraSUtil.tr,
                  onPressed: () => getImage(imgType,
                      ImageSource.camera) //(){},// controller.onFilterTap,
              ),
            ),
            SizedBox(height: sizeH(10)),
            //apply filters
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
              child: Button(
                  text: gallerySUtil.tr,
                  onPressed: () => getImage(imgType,
                      ImageSource.gallery) //(){},// controller.onFilterTap,
              ),
            ),
          ],
        ),
      ),
    );
  }

}