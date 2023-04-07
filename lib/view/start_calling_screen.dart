import 'package:erinet_app/utils/assets_utils.dart';
import 'package:erinet_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_buttons.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../components/dummy_loader.dart';
import '../controller/connect_call_controller.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';

class StartCallingScreen extends GetView<ConnectCallController> {
  StartCallingScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const SafeArea(
        left: false,
        right: false,
        child: CustomBottomTabBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
          child: Column(
            children: [
              //heading
              heading(startCallingSUtil.split(' ')[0],
                  startCallingSUtil.split(' ')[1]),

              height(30),
              _body(),

              Button(
                width: Get.width,
                text: startCallingSUtil,
                onPressed: controller.onStartCall,
              ),
              // _bodyNew(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      height: (Get.height / 100) * 60,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _form(Assets.userProfileIcon, "+48755857566"),
          ),
          Expanded(
            child: Center(
                child: RotatedBox(
              quarterTurns: 1,
              child: SpinKitThreeBounce(
                color: primaryColorSwatch.shade300,
                size: 100.0,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _form(Assets.userProfileIcon, "+8545857547"),
          ),
          height(30),
        ],
      ),
    );
  }

  Widget _form(asset, phoneNu) {
    return Column(
      children: [
        circleAvatar(
          asset: asset,
          bgColor: Colors.white,
          size: sizeW(100),
        ),
        height(15),
        Text(phoneNu),
      ],
    );
  }
}
