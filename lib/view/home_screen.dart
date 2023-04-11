import 'dart:ui';

import 'package:erinet_app/controller/home_controller.dart';

import '../components/custom_widgets.dart';
import '../components/text_field.dart';
import '../utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_drawer.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final xController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onDashboardBack,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColorSwatch,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
        ),
        drawer: const CustomDrawer(),
        extendBodyBehindAppBar: true,
        extendBody: true,
        key: _scaffoldKey,
        bottomNavigationBar: const SafeArea(
          left: false,
          right: false,
          top: false,
          child: CustomBottomTabBar(),
        ),
        body: Stack(
          children: [
            //background image

            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.userBg), fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5),
                child: Container(
                    color: Colors.black.withOpacity(0.1), child: null),
              ),
            ),

            //body
            Positioned(
              top: kToolbarHeight + sizeH(20),
              width: Get.width,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeW(30), vertical: sizeH(30)),
                  child: _body()),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(10),
          Text(connectDescSUtil, style: reg18.copyWith(color: textWhiteColor)),
          height(50),
          _form(),
          height(250),
          Button(
            text: findAgentSUtil,
            onPressed: controller.onFindAgentTap,
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Column(
      children: [
        MyTextField(
          validator: InputValidations.commonValidation,
          label: enterPhoneSUtil,
          borderColor: textWhiteColor,
          controller: controller.mobileNumberController,
          style: const TextStyle(color: textWhiteColor),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          prefixIcon:
              Icon(Icons.phone_outlined, color: Colors.white, size: sizeW(20)),
          suffixIcon: Icon(Icons.contacts_outlined,
              color: Colors.white, size: sizeW(20)),
        ),
        height(15),
        /*MyTextField(
          validator: InputValidations.commonValidation,
          label: callTimeDurationSUtil,
          style: const TextStyle(color: textWhiteColor),
          borderColor: textWhiteColor,
          keyboardType: TextInputType.phone,
          prefixIcon:
              Icon(Icons.timer_outlined, color: Colors.white, size: sizeW(20)),
          *//*suffixIcon: Container(
            width: 300.0,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  items: controller.durationList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (onChanged){},
                ),
              ),
            ),
          ),*//*
          suffixIcon: GestureDetector(
            onTap: controller.selectCallDuration,
            child: Icon(Icons.keyboard_arrow_down_outlined,
                color: Colors.white, size: sizeW(20)),
          ),
        ),*/
        CountriesField(
          focusNode: controller.callFocusNode,
          list: controller.durationList,
          textController: controller.callEditingController,
          child: MyTextField(
            controller: controller.callEditingController,
            focusNode: controller.callFocusNode,
            validator: InputValidations.commonValidation,
            label: callTimeDurationSUtil,
            style: const TextStyle(color: textWhiteColor),
            borderColor: textWhiteColor,
            keyboardType: TextInputType.phone,
            prefixIcon: Icon(Icons.timer_outlined,
                color: Colors.white, size: sizeW(20)),
            suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,
                color: Colors.white, size: sizeW(20)),
          ),
        ),
      ],
    );
  }
}
