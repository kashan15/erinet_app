import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';

import '../components/custom_widgets.dart';
import '../controller/login_controller.dart';
import '../utils/route_utils.dart';
import '../utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_buttons.dart';
import '../components/text_field.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/string_utils.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    controller.globalContext = context;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeW(30), vertical: sizeH(100)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  header(),
                  height(30),
                  body(),
                  height(20),
                  divider(),
                  height(20),
                  SizedBox(
                    width: sizeW(200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        socialIcon(Assets.google),
                        socialIcon(Assets.microsoft),
                        socialIcon(Assets.apple),
                      ],
                    ),
                  ),
                  height(50),
                  privacyPolicy(
                      privacyConfirmSUtil,
                      privacySUtil,
                      controller.onPrivacyCheckClick,
                      controller.privacyPolicyCheck.value),
                  height(10),
                  privacyPolicy(
                      termsConfirmSUtil,
                      termsSUtil,
                      controller.onTermsCheckClick,
                      controller.termsAndConditionCheck.value),
                  height(50),
                  Button(
                    // width: sizeW(280),
                    text: nextSUtil,
                    onPressed: () => Get.toNamed(kUserTypeScreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(welcomeToSUtil,
              style: med12.copyWith(color: primaryColorSwatch)),
          height(5),
          Text(erinetSUtil,
              style: bold.copyWith(
                fontSize: sizeFS(50),
                height: 1,
                color: primaryColorSwatch,
              )),
          Text(letsGetStartedSUtil,
              style: med12.copyWith(color: primaryColorSwatch, height: 1)),
        ],
      ),
    );
  }

  Widget body() {
    return Obx(
      () => Column(
        children: [
          MyTextField(
            validator: InputValidations.commonValidation,
            label: enterYourNameSUtil,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            hintColor: Colors.black.withAlpha(50),
            textAlign: TextAlign.left,
            autoFocus: false,
            suffixIcon: SizedBox(
              width: sizeW(65),
            ),
            prefixIcon: SizedBox(
              width: sizeW(80),
            ),
          ),
          height(10),
          MyTextField(
            validator: InputValidations.commonValidation,
            label: enterPhoneSUtil,
            keyboardType: TextInputType.phone,
            hintColor: Colors.black.withAlpha(50),
            textAlign: TextAlign.left,
            autoFocus: false,

            prefixIcon: GestureDetector(
              child: SizedBox(
                  width: sizeW(80),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.xyz.value,
                            style: med22.copyWith(color: Colors.black),
                          ),
                          const Icon(Icons.arrow_drop_down_outlined),
                        ],
                      ),
                    ),
                  )),
              onTap: () => showCountryPicker(
                context: controller.globalContext,
                showPhoneCode: true,
                onSelect: (Country country) {
                  if (kDebugMode) {
                    print('Select country: ${country.flagEmoji}');
                  }
                  controller.xyz.value = country.flagEmoji;
                },
                countryListTheme: CountryListThemeData(
                  bottomSheetHeight: Get.height * 0.8,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40.0),
                        )),
                  ),
                  searchTextStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            suffixIcon: SizedBox(
              width: sizeW(65),
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return SizedBox(
        width: sizeW(250),
        child: Row(
          children: [
            const Expanded(
                child: Divider(
              color: textGreyColor,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(5)),
              child: Text(
                connectWithSUtil,
                style: reg12.copyWith(color: textGreyColor),
              ),
            ),
            const Expanded(
                child: Divider(
              color: textGreyColor,
            )),
          ],
        ));
  }

  Widget socialIcon(String asset) {
    return Container(
      width: sizeW(40),
      height: sizeW(40),
      decoration: const BoxDecoration(
          color: fieldColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: textGreyColor,
              offset: Offset(
                0.0,
                3.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ]),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image(image: AssetImage(asset), fit: BoxFit.fitWidth),
      ),
    );
  }

  Widget privacyPolicy(String text, linkText, var funcCheck, bool checkValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: "$text ",
            style: med12.copyWith(color: textGreyColor),
            children: <TextSpan>[
              TextSpan(
                text: linkText,
                style: med12.copyWith(
                  color: primaryColorSwatch,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: funcCheck,
          child: Icon(
              checkValue
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_outlined,
              color: primaryColorSwatch,
              size: sizeW(20)),
        )
      ],
    );
  }
}
