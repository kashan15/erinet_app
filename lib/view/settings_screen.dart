import 'package:erinet_app/components/custom_widgets.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_drawer.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              settingsSUtil,
              style: med28.copyWith(
                color: primaryColorSwatch,
                height: 1,
              ),
            ),
            _body()
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _settingTile(Icons.notification_important_outlined,
            notificationSettingSUtil, kNotificationSettingScreen),
        _settingTile(Icons.comment_bank, bankAccountDetailsSUtil, kBankAccountDetailsScreen),
        _settingTile(Icons.app_blocking_outlined, deactivateAccountSUtil, kDeactivateAccountScreen),
      ],
    );
    // return Expanded(
    //   child: ListView.builder(itemCount: 5,itemBuilder: (_,index){
    //     return _settingTile();
    //   }),
    // );
  }

  Widget _settingTile(IconData leadingIcon, String title, String route) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox.square(
          dimension: sizeW(40),
          child: MyBox(
            color: primaryColorSwatch.shade100,
            radius: 7,
            child: Icon(
              leadingIcon,
              color: primaryColorSwatch,
            ),
          )),
      title: Text(
        title,
        style: med14.copyWith(color: primaryColorSwatch),
      ),
      trailing: MyBox(
        color: textGreyLightColor,
        radius: 7,
        child: const Icon(
          Icons.navigate_next,
          color: primaryColorSwatch,
        ),
      ),
      onTap: () => Get.toNamed(route),
    );
  }
}
