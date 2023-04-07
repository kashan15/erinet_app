import 'package:erinet_app/components/custom_widgets.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_buttons.dart';
import '../components/new_custom_dialog.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class NotificationSettingScreen extends StatelessWidget {
  NotificationSettingScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading(notificationSettingSUtil.split(' ')[0],
                notificationSettingSUtil.split(' ')[1]),
            height(30),
            _body(),
            height(190),
            Align(
              alignment: Alignment.bottomCenter,
              child: Button(
                text: saveSUtil,
                onPressed: () =>  Get.dialog(
                  CustomDialogOne(
                    icon: Icons.check_circle,
                    primaryLabel: "Yes",
                    secondaryLabel: "Next",
                    primaryTap: (){
                      Get.toNamed(kLoginScreen);
                    },
                    secondaryTap: ()=> Navigator.pop(Get.context!),
                    title: "Settings have been save\n\tSuccessfully",

                  ),

                ).then((value) => Get.back()),
              ),
            ),
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
        _settingTile(Icons.comment_bank, bankAccountDetailsSUtil, ''),
        _settingTile(Icons.app_blocking_outlined, deactivateAccountSUtil, ''),
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
      trailing: Switch(
          onChanged: (_) {},
          value: true,
          activeColor: accentColorSwatch,
          activeTrackColor: textGreyColor,
          inactiveThumbColor: textGreyColor),
      onTap: () => Get.toNamed(route),
    );
  }
}
