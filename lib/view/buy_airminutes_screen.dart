/*

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../components/text_field.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class BuyAirMinutesScreen extends StatefulWidget {
  const BuyAirMinutesScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirMinutesScreen> createState() => _BuyAirMinutesScreenState();
}

class _BuyAirMinutesScreenState extends State<BuyAirMinutesScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomTabBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * 1,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
                child: Column(
                  children: [
                    height(30),
                    heading(buyAirMinutesSUtil.split(' ')[0],
                        buyAirMinutesSUtil.split(' ')[1]),
                    height(30),
                    _header(),
                    height(25),
                    _body(),
                    height(25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("AirMinutes History",
                          style: med12.copyWith(color: primaryColorSwatch)),
                    ),
                  ],
                ),
              ),
              _airMinutesHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return MyBox(
      color: primaryColorSwatch,
      height: sizeH(110),
      radius: 7,
      child: Stack(
        children: [
          Positioned(
              top: 8,
              right: 8,
              child: circleAvatar(asset: Assets.men, size: 50, shadow: false)),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your AirMinutes",
                        style: med12.copyWith(color: textColorPurple)),
                    Text("40",
                        style: bold.copyWith(
                          fontSize: 50,
                          color: textWhiteColor,
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyTextField(
              width: Get.width / 2.6,
              validator: InputValidations.commonValidation,
              label: enterAmountSUtil,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              topLabel: amountSUtil,
              textAlign: TextAlign.start,
            ),
            MyTextField(
              width: Get.width / 2.6,
              validator: InputValidations.commonValidation,
              label: enterAirMinutesSUtil,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              topLabel: airMinutesSUtil,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        height(25),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(selectPaymentMethodSUtil,
              style: med12.copyWith(color: primaryColorSwatch)),
        ),
        height(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _paymentBox(1),
            _paymentBox(2),
            _paymentBox(3),
          ],
        ),
        height(25),
        Button(
          color: accentColorSwatch,
          text: nextSUtil,
          onPressed: () => Get.toNamed(kBankTransferScreen),
        ),
      ],
    );
  }

  Widget _airMinutesHistory() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: sizeH(5)),
              child: _historyBox(1),
            );
          }),
    );
  }

  Widget _historyBox(int index) {
    return MyBox(
        width: Get.width,
        height: sizeH(70),
        color: textGreyLightColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox.square(
                    dimension: sizeW(40),
                    child: MyBox(
                      color: primaryColorSwatch.shade100,
                      radius: 7,
                      child: const Icon(
                        Icons.access_time_outlined,
                        color: primaryColorSwatch,
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bought 40 AirMinutes from airtel",
                            style: med12.copyWith(color: textBlackColor)),
                        Text("20-02-23",
                            style: reg8.copyWith(color: textBlackColor)),
                      ],
                    ),
                  ),
                ),
              ),
              Text("\$40",
                  style: med12.copyWith(
                      color: textBlackColor, fontSize: sizeFS(10))),
            ],
          ),
        ));
  }

  Widget _paymentBox(int selected) {
    return GestureDetector(
      onTap: () {
        selectedPayment = selected;
        setState(() {});
      },
      child: MyBox(
        width: sizeW(75),
        height: sizeW(75),
        color: textGreyLightColor,
        radius: 7,
        borderColor: selectedPayment != selected
            ? Colors.transparent
            : primaryColorSwatch,
        borderWidth: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.airtelLogo),
        ),
      ),
    );

    // return Container(
    //   width: sizeW(75),
    //   height: sizeW(75),
    //   color: textGreyLightColor,
    //   decoration: BoxDecoration(
    //     border:
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Image.asset(Assets.airtelLogo),
    //   ),
    // );
  }
}
*/