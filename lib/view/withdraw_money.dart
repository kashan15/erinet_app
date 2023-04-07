import 'package:erinet_app/components/new_custom_dialog.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/input_validations.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class WithdrawMoneyScreen extends StatelessWidget {
  WithdrawMoneyScreen({Key? key}) : super(key: key);

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
                child: heading(withdrawMoneySUtil.split(' ')[0],
                    withdrawMoneySUtil.split(' ')[1]),
              ),
              height(30),
              _header(),
              height(25),
              _withdrawBody(),
              height(25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(withdrawHistorySUtil,
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
                      Text("\$ 400",
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

  Widget _withdrawBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(withdrawSUtil,
                  style: med12.copyWith(color: primaryColorSwatch)),
            ),
          ),
          // height(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizeW(20)),
            child: MyTextField(
              width: Get.width,
              validator: InputValidations.commonValidation,
              label: enterWithdrawAmountSUtil,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              // topLabel: amountSUtil,
              textAlign: TextAlign.start,
            ),
          ),
          height(25),
          Button(
            color: accentColorSwatch,
            text: nextSUtil,
            onPressed: () {
              Get.dialog(AlertOverlay(
                  icon: Icons.account_balance_wallet_outlined,
                  label: sendRequestAlertSUtil));
            },
          ),
        ],
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
            mainAxisSize: MainAxisSize.max,
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
              SizedBox(
                width: sizeW(250),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Withdraw",
                                style: med12.copyWith(color: textBlackColor)),
                            Text("20-02-23",
                                style: reg8.copyWith(color: textBlackColor)),
                          ],
                        ),
                      ),
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
}
