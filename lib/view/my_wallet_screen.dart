import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/my_wallet_controller.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class MyWalletScreen extends GetView<MyWalletController> {
  MyWalletScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * 1.1,
          child: Column(
            children: [
              height(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
                child: heading(
                    myWalletSUtil.split(' ')[0], myWalletSUtil.split(' ')[1]),
              ),
              height(30),
              _header(),
              height(25),
              controller.userType == 2 ? _rechargeBody() : const SizedBox(),
              height(25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Recharge History",
                      style: med12.copyWith(color: primaryColorSwatch)),
                ),
              ),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
      child: MyBox(
        color: primaryColorSwatch,
        height: sizeH(110),
        radius: 7,
        child: Stack(
          children: [
            Positioned(
                top: 8,
                right: 8,
                child:
                    circleAvatar(asset: Assets.men, size: 50, shadow: false)),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(yourBalanceSUtil,
                          style: med12.copyWith(color: textColorPurple)),
                      Text("\$ 40",
                          style: bold.copyWith(
                            fontSize: 50,
                            color: textWhiteColor,
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _rechargeBody() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(rechargeSUtil,
                  style: med12.copyWith(color: primaryColorSwatch)),
            ),
            MyTextField(
              width: Get.width,
              validator: InputValidations.commonValidation,
              label: enterRechargeAmountSUtil,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              // topLabel: amountSUtil,
              textAlign: TextAlign.start,
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
        ),
      ),
    );
  }

  Widget _body() {
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
                        Text("Recharged 40\$ from airtel",
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
      onTap: () => controller.onSelectPayment(selected),
      child: MyBox(
        width: sizeW(75),
        height: sizeW(75),
        color: textGreyLightColor,
        radius: 7,
        borderColor: controller.selectedPayment.value != selected
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
