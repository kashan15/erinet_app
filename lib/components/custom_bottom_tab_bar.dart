import 'package:badges/badges.dart';
import 'package:erinet_app/controller/pending_controller.dart';
import 'package:erinet_app/utils/storage_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/colors_utils.dart';
import '../utils/route_utils.dart';
import '../utils/textStyles.dart';
import 'custom_widgets.dart';

class CustomBottomTabBar extends StatefulWidget {
  // const CustomBottomTabBar({Key? key}) : super(key: key);

  const CustomBottomTabBar({super.key, this.height});

  final double? height;

  @override
  State<CustomBottomTabBar> createState() => _CustomBottomTabBarState();
}

class _CustomBottomTabBarState extends State<CustomBottomTabBar> {
  late final List<Widget> bottomBarList;
  late final int userType;

  @override
  void initState() {
    super.initState();
    userType = GetStorage().read(userTypePrefUtil);
    bottomBarList = userType == 1
        //agent flow
        ? [
            getTab(
              Icons.home_outlined,
              'Home',
              route: kAgentHomeScreen,
            ),
            getTab(
              Icons.access_time,
              'Recent',
              route: kCallHistoryScreen,
            ),
            getTab(
              Icons.pending_actions_outlined,
              'Pending',
              showBadge: true,
              route: kPending,
            ),
            getTab(
              Icons.person_outline,
              'ME',
              route: kProfileScreen,
            ),
          ]
        //user flow
        : [
            getTab(
              Icons.home_outlined,
              'Home',
              route: kHomeScreen,
            ),
            getTab(
              Icons.access_time,
              'Recent',
              route: kCallHistoryScreen,
            ),
            getTab(
              Icons.shopping_cart_outlined,
              'Purchase',
              route: kMyWalletScreen,
            ),
            getTab(
              Icons.person_outline,
              'ME',
              route: kProfileScreen,
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? sizeH(65),
      decoration: const BoxDecoration(
        color: primaryColorSwatch,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomBarList,
      ),
    );
  }

  getTab(IconData image, String text,
      {Color? iconColor, required String route, bool showBadge = false}) {
    return InkWell(
      splashColor: primaryColorSwatch,
      onTap: () {
        if (Get.currentRoute != route) {
          if(route == kPending){
            PendingController.getPending();
            return;
          }
          Get.offAndToNamed(route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Badge(
            showBadge: showBadge,
            child: Icon(
              image,
              color: textGreyColor, //iconColor,
            ),
          ),
          Text(
            text,
            style: reg12.copyWith(color: textGreyColor),
          )
        ],
      ),
    );
  }
}
