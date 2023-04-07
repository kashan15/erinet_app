import 'dart:io';

import 'package:erinet_app/controller/login_controller.dart';
import 'package:erinet_app/controller/profile_controller.dart';
import 'package:erinet_app/utils/route_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/custom_drawer.dart';
import '../components/text_field.dart';

import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/textStyles.dart';
import 'Package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_widgets.dart';
import '../utils/string_utils.dart';

class ProfileScreen extends GetView<LoginController> {
  late double size = sizeW(25);

  // LoginController userIdInstance = LoginController();


  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      // backgroundColor: Colors.yellow,
      appBar: CustomAppBar(
        scaffoldKey: controller.scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const SafeArea(
        left: false,
        right: false,
        top: false,
        child: CustomBottomTabBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
          child:
            Column(
              children: [
                //heading

                heading(
                  controller.userTypeId.value == 1 ?
                    agentSUtil : userSUtil,
                    profileSUtil
                ) ,

                // profile pic

                   Obx(
                       ()=> Stack(
                        children: [

                         // circleAvatar(
                         //    imageWidget: controller.imagepath.value ==  '' ?
                         //    Image.asset(Assets.men) : Image.file(File(controller.imagepath!.value)),
                         //    size: sizeW(120),
                         //    shadow: false,
                         //    border: true, asset: null),
                          _getProfileImage(),

        //                    Positioned(
        //                       top: 15, left: 215,
        //                       child: GestureDetector(
        //                         onTap: controller.getImage,
        //                         child: CircleAvatar(
        //                           radius: 15,
        //                           backgroundColor: cameraBg,
        //                           child: Center(
        //                             child: Image.asset(Assets.camera, height: 20,)
        //                           ),
        //                         ),
        //                       )
        //
        //
        //                       circleAvatar(
        //                           asset: Assets.camera,
        //                           bgColor: cameraBg,
        //                           boxFit: BoxFit.none,
        //                           size: sizeW(25),
        //                           shadow: false,
        //                           border: true),
        //                       Container(
        //                         width: 60,
        //                         // height: size,
        //                         decoration: const BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           color: Colors.yellow
        //                         ),
        //                       )
        //
        // ),
                  ]),
                   ),

                height(35),

                //form
                _form(),
                height(20),

                //button save
                Button(
                  text: saveSUtil,
                  onPressed: ()=>  ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
                    backgroundColor: Colors.black,
                      content: Text(
                        "Changes have been saved",
                      ))),

                      // controller.userTypeId.value == 1 ?
                      // Get.toNamed(kAgentHomeScreen) :
                      // Get.toNamed(kHomeScreen)

                ),
              ],
            ),
          ),
        ),
      );

  }

  Widget _form() {
    return Column(
      children: [
        //full name
        MyTextField(
          validator: InputValidations.commonValidation,
          label: enterFullNameSUtil,
          controller: controller.profileNameController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          topLabel: fullNameSUtil,
        ),
        height(15),

        //email address
        MyTextField(
          validator: InputValidations.emailValidation,
          label: enterEmailSUtil,
          controller: controller.profileEmailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          topLabel: emailSUtil,
        ),
        height(15),

        //mobile number
        MyTextField(
          validator: InputValidations.commonValidation,
          label: enterPhoneSUtil,
          controller: controller.profileMobileController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          topLabel: phoneNumberSUtil,
        ),
        height(15),

        //date of birth
        MyTextField(
          validator: InputValidations.commonValidation,
          label: enterDateOfBirthSUtil,
          controller: controller.profileDobController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: dateOfBirthSUtil,
        ),
        height(15),

        //gender
        SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                genderSUtil,
                style: med14.copyWith(color: textGreyColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _genderBox(genderMaleSUtil, 1),
                  width(10),
                  _genderBox(genderFemaleSUtil, 2),
                ],
              ),
            ],
          ),
        ),
        height(15),

        //location
        MyTextField(
          validator: InputValidations.commonValidation,
          label: enterLocationSUtil,
          controller: controller.profileLocationController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.streetAddress,
          topLabel: locationSUtil,
        ),
        height(15),

        //user id
        MyTextField(
          validator: InputValidations.commonValidation,
          label: iDSUtil,
          controller: controller.profileIdController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          topLabel: iDSUtil,
          suffixIcon: GestureDetector(
            onTap: () async {
              Clipboard.setData(ClipboardData(text: controller.profileIdController.text))
                  .then((_) {
                ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
                    content: Text(
                  "ID copied to clipboard",
                )));
              });
            },
            child: const Icon(
              Icons.copy,
            ),
          ),
        ),
        height(15),
      ],
    );
  }

  Widget _genderBox(String text, int value) {
    return Expanded(
      child: Obx(
        () => MyBox(
            // width:sizeW(160),
            height: sizeH(50),
            radius: 7,
            borderColor: Colors.black,
            borderWidth: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Radio(value: value, groupValue: 1, onChanged: (_) {}),

                Radio(
                    value: value,
                    groupValue: controller.defaultValue.value,
                    onChanged: (value) {
                      controller.defaultValue.value = value!;
                    }),
                Text(text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: med12.copyWith(color: Colors.black)),
              ],
            )),
      ),
    );
  }

  Widget _getProfileImage() {
    return SizedBox.square(
      dimension: controller.blockHeight * 110,
      child: Stack(
        children: [
          controller.profilePicImg.value.isNotEmpty
              ?
          CircleAvatar(
            backgroundColor: primaryColorSwatch,
            radius: controller.blockHeight * 90,
                child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: controller.blockHeight * 52.5,
                backgroundImage: FileImage(File(controller.profilePicImg.value))),
              )
              : CircleAvatar(
            backgroundColor: primaryColorSwatch,
            radius: controller.blockHeight * 90,
                child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: controller.blockHeight * 52.5,
                backgroundImage: const AssetImage(Assets.men,)
          ),
              ),

          //image picker// add picture
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              /// Previous Bottom sheet with camera and gallery
              //onTap: () => controller.getPickerType(imgProfilePicSUtil),
              onTap: ()=> Get.bottomSheet(
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
                            // onPressed: () => getImage(imgType,
                            //     ImageSource.camera
                            // )
                          onPressed: ()=> Navigator.pop(Get.context!),
                          // (){},// controller.onFilterTap,
                        ),
                      ),
                      SizedBox(height: sizeH(10)),
                      //apply filters
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
                        child: Button(
                            text: gallerySUtil.tr,
                            // onPressed: () => getImage(imgType,
                            //     ImageSource.gallery)
                          onPressed: ()=> Navigator.pop(Get.context!),

                          //(){},// controller.onFilterTap,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: CircleAvatar(
                backgroundColor: cameraBg,
                radius: controller.blockHeight * 15.5,
                child: Image.asset(Assets.camera, height: controller.blockHeight * 20,)
              ),
            ),
          ),
        ],
      ),
    );
    // return ;
  }


}


