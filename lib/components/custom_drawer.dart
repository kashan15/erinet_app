import 'dart:ui';

import 'package:erinet_app/utils/storage_utils.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/colors_utils.dart';
import '../utils/route_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/assets_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';
import 'custom_rating_bar.dart';
import 'custom_widgets.dart';
import 'new_custom_dialog.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late final List<DrawerModel> listMenuTile;

  late final int userType;

  @override
  void initState() {
    super.initState();
    userType = GetStorage().read(userTypePrefUtil);
    listMenuTile = (userType == 1
        // agent flow
        ? [
            //profile
            DrawerModel(
                icon: Icons.person_outline,
                label: profileSUtil,
                routeName: kProfileScreen,
            ),

            //Settings
            DrawerModel(
                icon: Icons.settings_outlined,
                label: settingsSUtil,
                routeName: kSettingsScreen),

            //messages
            DrawerModel(
                icon: Icons.message_outlined,
                label: messagesSUtil,
                routeName: kChatScreen),

            //My Notification
            DrawerModel(
                icon: Icons.notifications_none,
                label: myNotificationSUtil,
                routeName: kMyNotificationScreen),

            //About
            DrawerModel(
                icon: Icons.info_outline,
                label: aboutSUtil,
                routeName: kAboutScreen),

            //logout
            DrawerModel(
                icon: Icons.logout_outlined,
                label: logoutSUtil,
                routeName: kLogout,

            ),
          ] // agent flow

        // user flow
        : [
            //profile
            DrawerModel(
                icon: Icons.person_outline,
                label: profileSUtil,
                routeName: kProfileScreen),

            //Call history
            DrawerModel(
                icon: Icons.call_outlined,
                label: callHistorySUtil,
                routeName: kCallHistoryScreen),

            //Settings
            DrawerModel(
                icon: Icons.settings_outlined,
                label: settingsSUtil,
                routeName: kSettingsScreen),

            //My Wallet
            DrawerModel(
                icon: Icons.wallet_outlined,
                label: myWalletSUtil,
                routeName: kMyWalletScreen),

            //My Notification
            DrawerModel(
                icon: Icons.notifications_none,
                label: myNotificationSUtil,
                routeName: kMyNotificationScreen),

            //About
            DrawerModel(
                icon: Icons.info_outline,
                label: aboutSUtil,
                routeName: kAboutScreen),

            //logout
            DrawerModel(
                icon: Icons.logout_outlined,
                label: logoutSUtil,
                routeName: kLogout),
          ]); // user flow
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.0,
        sigmaY: 3.0,
      ),
      child: Drawer(
        backgroundColor: primaryColorSwatch,
        width: sizeW(350),
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            getDrawerHeader(),
            getDrawerBody(),
            getDrawerFooter(),
          ],
        ),
      ),
    );
  }

  Widget getDrawerHeader() {
    return DrawerHeader(
      curve: Curves.easeInOutBack,
      decoration: const BoxDecoration(color: primaryColorSwatch),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              circleAvatar(
                  // alignment: Alignment.topLeft,
                  asset: Assets.men,
                  size: sizeH(80),
                  shadow: false),
              Text("Agent Name", style: med18.copyWith(color: textWhiteColor)),
              Text("ID: 007",
                  style: reg12.copyWith(color: textWhiteColor, height: 1)),
              rating(4.5, 25),
            ],
          ),
          Row(
            children: [
              Text("Wallet", style: med8.copyWith(color: textWhiteColor)),
              width(10),
              MyBox(
                  maxWidth: sizeW(70),
                  radius: 7,
                  color: accentColorSwatch,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizeW(10), vertical: sizeH(5)),
                    child: Text("\$ 400000",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: med8.copyWith(color: textWhiteColor)),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget getDrawerBody() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: false,
          itemCount: listMenuTile.length,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) => DrawerItems(
                label: listMenuTile[i].label.tr,
                asset: listMenuTile[i].icon,
                onTap: () async {
                  if (kDebugMode) {
                    print("currentRoute:: ${Get.currentRoute}");
                  }
                  if (listMenuTile[i].routeName == kLogout) {
                    Get.dialog(
                                CustomDialog(
                          icon: Icons.logout,
                          primaryLabel: "Yes",
                          secondaryLabel: "No",
                          primaryTap: (){
                            Get.toNamed(kLoginScreen);
                          },
                          secondaryTap: ()=> Navigator.pop(Get.context!),
                          title: "Logout",
                          label: "Are you sure you want to logout?",
                        ),

                    ).then((value) => Get.back());
                    return;
                  }
                  Get.offAndToNamed(listMenuTile[i].routeName);

                  // if (listMenuTile[i].routeName == logoutSUtil) {
                  //   Get.dialog(const Center(child: CircularProgressIndicator()));
                  //   await LogoutApi.getLogoutResponse().then((value) {
                  //     if (value.result == true) {
                  //       // Get.back();
                  //       _getStorage.write(isAlreadyLoginUtil, false);
                  //       Get.offAllNamed(kNewLoginScreen);
                  //     } else {
                  //       Get.back();
                  //       Get.snackbar(alertSUtil.tr, wentWrongSUtil.tr,
                  //           snackPosition: SnackPosition.BOTTOM);
                  //     }
                  //   });
                  // } else if (listMenuTile[i].routeName == settingsSUtil) {
                  //   getSettings();
                  // } else if (Get.currentRoute == kDashboardTab) {
                  //   Get.back();
                  //   Get.toNamed(listMenuTile[i].routeName);
                  // }  else {
                  //   Get.back();
                  //   Get.offNamed(listMenuTile[i].routeName);
                  // }
                },
              )),
    );
  }

  Widget getDrawerFooter() {
    return SizedBox(
      height: sizeH(160),
      child: Column(
        children: [
          Divider(
            color: primaryColorSwatch.shade200,
            thickness: 1,
          ),
          DrawerItems(
            asset: Icons.share_outlined,
            label: shareAppSUtil,
            subTitle: shareAppSubSUtil,
          ),
          DrawerItems(
            asset: Icons.help_outline_outlined,
            label: helpFeedbackSUtil,
          ),
        ],
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  String label;
  String? subTitle;
  var asset;
  GestureTapCallback? onTap;

  DrawerItems(
      {Key? key,
      required this.label,
      this.subTitle,
      required this.asset,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: genericAsset(asset: asset, iconColor: textWhiteColor),
        title: Text(label, style: med14.copyWith(color: textWhiteColor)),
        subtitle: subTitle != null
            ? Text(
                subTitle!,
                style: reg12.copyWith(
                    fontSize: sizeFS(10), color: textWhiteColor, height: 1),
              )
            : null,
        onTap: onTap);
  }
}

class DrawerModel {
  DrawerModel(
      {required this.icon, required this.label, required this.routeName});

  var icon;
  final String label;
  final String routeName;
}
