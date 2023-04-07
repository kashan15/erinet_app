import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/custom_widgets.dart';
import '../controller/call_history_detail_controller.dart';
import '../model/call_history_model.dart';
import '../utils/assets_utils.dart';
import '../utils/colors_utils.dart';
import '../utils/string_utils.dart';
import '../utils/textStyles.dart';

class CallHistoryDetailScreen extends StatelessWidget {
  CallHistoryDetailScreen({Key? key}) : super(key: key);

  final controller = Get.find<CallHistoryDetailController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height(7),
            divider(),
            _header(),
            // height(10),
            divider(),
            height(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeW(75 )),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  callHistorySUtil,
                  style: med12.copyWith(color: textBlackColor.withAlpha(150)),
                ),
              ),
            ),
            height(10),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(10)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: sizeW(60),
              child: circleAvatar(
                  alignment: Alignment.bottomLeft,
                  asset: Assets.men,
                  size: sizeW(60)),
            ),
            width(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.callHistoryModel.name!,
                  style: bold18,
                ),
                Text(controller.callHistoryModel.phoneNumber!,
                    style: reg12.copyWith(color: textBlackColor)),
              ],
            ),
            const Spacer(),
            SizedBox(width: sizeW(100), child: _icons()),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: sizeH(5)),
            child: _callHistory(1),
          );
        });
  }

  Widget _callHistory(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeW(30), vertical: sizeH(0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Transform.rotate(
            angle:
                controller.callHistoryModel.callType == CallType.outgoingCall
                    ? 200
                    : 90,
            child: Icon(
              Icons.arrow_forward,
              color:
                  controller.callHistoryModel.callType == CallType.missedCall
                      ? Colors.red
                      : Colors.green,
              // size: sizeW(15),
            ),
          ),
          width(25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.callHistoryModel.name!,
                style: med18,
              ),
              Row(
                children: [
                  Text("03-March-23",
                      style: reg12.copyWith(color: textBlackColor)),
                  width(5),
                  Text("-",
                      style: reg12.copyWith(color: textBlackColor)),
                  width(5),
                  Text(controller.callHistoryModel.datetime!,
                      style: reg12.copyWith(color: textBlackColor)),
                  width(5),
                  Text("-",
                      style: reg12.copyWith(color: textBlackColor)),
                  width(5),
                  Text("20 mins, 30 secs",
                      style: reg12.copyWith(color: textBlackColor)),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(
          Icons.call_outlined,
          color: primaryColorSwatch,
        ),
        Icon(
          Icons.block,
          color: primaryColorSwatch,
        ),
        Icon(
          Icons.add,
          color: primaryColorSwatch,
        ),
      ],
    );
  }

/*
  Widget _agentBox(int index) {
    return MyBox(
        width: Get.width,
        height: sizeH(70),
        color: textGreyLightColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeW(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child:
                      circleAvatar(asset: Assets.men, size: 50, shadow: false)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeW(10)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.callHistoryModel.agentName!,
                            style: med12.copyWith(color: textBlackColor)),
                        Text("+44 123 098651234",
                            style: reg8.copyWith(color: textBlackColor)),
                      ],
                    ),
                  ),
                ),
              ),
              Text("01hour 20min",
                  style: med.copyWith(
                      color: textBlackColor, fontSize: sizeFS(10))),
              Text("2:00 pm",
                  style: med12.copyWith(
                      color: textBlackColor, fontSize: sizeFS(10))),
            ],
          ),
        ));
  }*/
}
