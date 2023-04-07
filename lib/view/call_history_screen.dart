import 'package:erinet_app/model/call_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_bottom_tab_bar.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../components/text_field.dart';
import '../controller/call_history_controller.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class CallHistoryScreen extends GetView<CallHistoryController> {
  CallHistoryScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomTabBar(),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            height(30),
            _header(),
            // height(10),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeW(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          heading(callSUtil, historySUtil),
          height(30),
          MyTextField(
            // width: sizeW(250),
            height: 40,
            radius: 24,
            prefixIcon: Padding(
              padding: EdgeInsets.all(sizeW(10)),
              child: Image.asset(Assets.searchIcon),
            ),
            suffixIcon:
                Transform.rotate(angle: 7, child: const Icon(Icons.add)),
          ),
          height(15),
          Align(
            alignment: Alignment.topLeft,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Map<CallType, String>>(
                items: controller.callTypeList.map((e) {
                  return DropdownMenuItem<Map<CallType, String>>(
                    value: e,
                    child: Text(e.values.single),
                  );
                }).toList(),
                onChanged: controller.onCallTypeChanged,
                value: controller.selectedCallType,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.historyFilteredList.length,
          itemBuilder: (_, index) {
            return _agentBox(index);
          }),
    );
  }

  Widget _agentBox(int index) {
    CallType callType = controller.historyFilteredList[index].callType!;
    return  ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          circleAvatar(asset: Assets.men, size: 50, shadow: false),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal:sizeW(30)),
      horizontalTitleGap: sizeW(30),
      title: Text(controller.historyFilteredList[index].name!,
          style: med12.copyWith(
              color: callType == CallType.missedCall ||
                  callType == CallType.inCompletedCall
                  ? Colors.red
                  : textBlackColor)),
      subtitle: Row(
        children: [
          Transform.rotate(
            angle: callType == CallType.outgoingCall ? 200 : 90,
            child: Icon(
              Icons.arrow_forward,
              color: (callType == CallType.missedCall)
                  ? Colors.red
                  : Colors.green,
              size: sizeW(15),
            ),
          ),
          width(2),
          Text("Japan",
              style: med12.copyWith(
                  color: callType == CallType.missedCall ||
                      callType == CallType.inCompletedCall
                      ? Colors.red.withAlpha(150)
                      : textBlackColor.withAlpha(150),
                  height: 0.6)),
          width(10),
          Text(controller.historyFilteredList[index].datetime!,
              style: med12.copyWith(
                  color: callType == CallType.missedCall ||
                      callType == CallType.inCompletedCall
                      ? Colors.red.withAlpha(150)
                      : textBlackColor.withAlpha(95),
                  fontSize: sizeFS(10))),
        ],
      ),

      trailing: GestureDetector(
        onTap: () => controller.onTap(index),
        child: Icon(
          Icons.info_outline,
          size: sizeW(20),
        ),
      ),
    );
   /* MyBox(
      width: Get.width,
      height: sizeH(70),
      // color: textGreyLightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // leading
            Align(
                alignment: Alignment.topCenter,
                child:
                    circleAvatar(asset: Assets.men, size: 50, shadow: false)),
            width(10),

            // body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(controller.historyFilteredList[index].name!,
                        style: med12.copyWith(
                            color: callType == CallType.missedCall ||
                                    callType == CallType.inCompletedCall
                                ? Colors.red
                                : textBlackColor)),
                    Row(
                      children: [
                        Transform.rotate(
                          angle: callType == CallType.outgoingCall ? 200 : 90,
                          child: Icon(
                            Icons.arrow_forward,
                            color: (callType == CallType.missedCall)
                                ? Colors.red
                                : Colors.green,
                            size: sizeW(15),
                          ),
                        ),
                        width(2),
                        Text("Japan",
                            style: med12.copyWith(
                                color: callType == CallType.missedCall ||
                                        callType == CallType.inCompletedCall
                                    ? Colors.red.withAlpha(150)
                                    : textBlackColor.withAlpha(150),
                                height: 0.6)),
                        width(10),
                        Text(controller.historyFilteredList[index].datetime!,
                            style: med12.copyWith(
                                color: callType == CallType.missedCall ||
                                        callType == CallType.inCompletedCall
                                    ? Colors.red.withAlpha(150)
                                    : textBlackColor.withAlpha(95),
                                fontSize: sizeFS(10))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            width(100),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => controller.onTap(index),
                child: Icon(
                  Icons.info_outline,
                  size: sizeW(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
