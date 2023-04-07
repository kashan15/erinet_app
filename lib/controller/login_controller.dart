import 'dart:io';

import 'package:erinet_app/components/custom_buttons.dart';
import 'package:erinet_app/components/custom_widgets.dart';
import 'package:erinet_app/utils/textStyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../components/new_custom_dialog.dart';
import '../utils/route_utils.dart';
import '../utils/storage_utils.dart';
import '../utils/string_utils.dart';

class LoginController extends GetxController {

    late BuildContext globalContext;
  RxBool privacyPolicyCheck = false.obs;
  RxBool termsAndConditionCheck = false.obs;
  final _getStorage = GetStorage();

  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  RxBool isFocus1 = false.obs;
  RxBool isFocus2 = false.obs;
  RxBool isFocus3 = false.obs;
  RxBool isFocus4 = false.obs;

  RxInt userTypeId = 0.obs;

  RxString xyz = ''.obs;

  @override
  void onInit() {
    super.onInit();
    focusNode1.addListener(() {
      if (focusNode1.hasPrimaryFocus) {
        isFocus1.value = true;
        isFocus2.value = false;
        isFocus3.value = false;
        isFocus4.value = false;
      }
    });
    focusNode2.addListener(() {
      if (focusNode2.hasPrimaryFocus) {
        isFocus1.value = false;
        isFocus2.value = true;
        isFocus3.value = false;
        isFocus4.value = false;
      }
    });
    focusNode3.addListener(() {
      if (focusNode3.hasPrimaryFocus) {
        isFocus1.value = false;
        isFocus2.value = false;
        isFocus3.value = true;
        isFocus4.value = false;
      }
    });
    focusNode4.addListener(() {
      if (focusNode4.hasPrimaryFocus) {
        isFocus1.value = false;
        isFocus2.value = false;
        isFocus3.value = false;
        isFocus4.value = true;
      }
    });
  }

  onPrivacyCheckClick() {
    privacyPolicyCheck.value = !privacyPolicyCheck.value;
  }

  onTermsCheckClick() {
    termsAndConditionCheck.value = !termsAndConditionCheck.value;
  }

  onUserTap(int userType) {
    userTypeId.value = userType;
  }

  onOtpSubmit() {
    if (userTypeId.value == 1) {
      Get.offAndToNamed(kAgentHomeScreen);
    } else if (userTypeId.value == 2) {
      Get.offAndToNamed(kHomeScreen);
    }
  }

  onUserNext() {
    _getStorage.write(userTypePrefUtil, userTypeId.value);
    if (userTypeId.value == 0) {
      Get.dialog(AlertOverlay(
        icon: Icons.notifications_none,
        primaryLabel: okSUtil,
        primaryTap: () => Get.back(),
        label: agentNotSelectedSUtil,
      ));
    } else {
      Get.offAndToNamed(kOtpScreen);
    }
    /*switch (userTypeId.value) {
      case 0:
        {
          Get.dialog(AlertOverlay(
            icon: Icons.notifications_none,
            primaryLabel: okSUtil,
            primaryTap: () => Get.back(),
            label: agentNotSelectedSUtil,
          ));
        }
        break;
      case 1:
        {
          Get.dialog(AlertOverlay(
            icon: Icons.notifications_none,
            primaryLabel: okSUtil,
            primaryTap: () => Get.back(),
            label: agentNotEligibleSUtil,
          ));
        }
        break;
      case 2:
        {
          Get.offAndToNamed(kOtpScreen);
        }
        break;
    }*/
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // focusNode1.
    // focusNode2.
    // focusNode3.
    // focusNode4.
    fieldOne.clear();
    fieldTwo.clear();
    fieldThree.clear();
    fieldFour.clear();
    super.onClose();
  }


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
