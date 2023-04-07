import 'package:erinet_app/controller/connect_call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';

class ConnectCallScreen extends GetView<ConnectCallController> {
  ConnectCallScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
        child: Column(
          children: [
            //heading
            heading(
                connectCallSUtil.split(' ')[0], connectCallSUtil.split(' ')[1]),

            height(30),
            agentBox(
              name: "User",
              primaryLabel: connectSUtil,
              // secondaryLabel: declineSUtil,
              totalRating: 4.5,
              ratingCount: 25,
              primaryOnTap: () => Get.toNamed(kStartConnectingCallScreen),
              // onPressed: ()=> Get.toNamed(kChatScreen),
            ),
            // _body(),
            // _bodyNew(),
          ],
        ),
      ),
    );
  }
}
