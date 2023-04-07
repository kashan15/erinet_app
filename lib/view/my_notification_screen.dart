import 'package:erinet_app/components/custom_app_bar.dart';
import 'package:erinet_app/components/custom_bottom_tab_bar.dart';
import 'package:erinet_app/components/custom_widgets.dart';
import 'package:erinet_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class MyNotificationScreen extends StatelessWidget {
  const MyNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeW(30), vertical: sizeH(30)),
            child: heading(myNotificationSUtil.split(' ')[0],
                myNotificationSUtil.split(' ')[1]),
          ),
          Expanded(
            child: ListView.builder(itemCount:5,itemBuilder: (_,index) {
              return _notificationBox();
            }),
          ),
        ],
      ),
    );
  }

  Widget _notificationBox() {
    return MyBox(
        width: Get.width,
        height: sizeH(100),
        border: Border(bottom: BorderSide(color: textGreyLightColor, width: 2)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              circleAvatar(asset: Assets.men, size: sizeW(55), shadow: false),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(5)),
                child: SizedBox(
                  width: sizeW(230),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(15),
                      Text("Admin",
                          style: med12.copyWith(color: textBlackColor)),
                      Text(
                          "Congratulations! You have successfully recharged \$40 from airtel. Enjoy your seamless communication experience.",
                          style: med8.copyWith(color: textBlackColor),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
              Text("3 min ago",
                  style: reg8.copyWith(
                      color: textBlackColor, fontSize: sizeFS(10))),
            ],
          ),
        ));
  }
}
