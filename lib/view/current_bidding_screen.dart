import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../components/new_custom_dialog.dart';
import '../utils/colors_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class CurrentBidingScreen extends StatelessWidget {
  CurrentBidingScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: scaffoldKey,
        ),
        bottomNavigationBar: const SafeArea(
          left: false,
          right: false,
          top: false,
          child: CustomBottomTabBar(),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(20)),
          child: SizedBox(height: Get.height, child: _body()),
        ));
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // height(10),
        heading(currentBiddingSUtil.split(" ")[0],
            currentBiddingSUtil.split(" ")[1]),
        height(50),
        Text("5 Agents Available",
            style: med12.copyWith(color: primaryColorSwatch)),
        Expanded(
          child: ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: sizeH(10)),
                  child: agentBox(
                      name: "User",
                      primaryLabel: bidSUtil,
                      secondaryLabel: declineSUtil,
                      totalRating: 4.5,
                      ratingCount: 25,
                      primaryOnTap: () => Get.dialog(AlertOverlay(
                            icon: Icons.notifications_none,
                            primaryLabel: okSUtil,
                            primaryTap: () {
                              Get.back();
                            },
                            label: bidAlertSUtil,
                          )
                              // onPressed: ()=> Get.toNamed(kChatScreen),
                              )),
                );
              }),
        ),
        // _agentBox()
      ],
    );
  }
}
