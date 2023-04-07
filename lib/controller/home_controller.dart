import 'dart:async';
import 'dart:ui';

import 'package:erinet_app/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:get/get.dart';

import '../components/dummy.dart';
import '../components/new_custom_dialog.dart';
import '../utils/route_utils.dart';
import '../utils/string_utils.dart';
import '../components/custom_widgets.dart';
import '../model/agent_home_model.dart';
import '../utils/colors_utils.dart';
import '../utils/textStyles.dart';

class HomeController extends GetxController {
  bool doBack = false;
  final RxDouble _progressValue = 0.0.obs;

  List<String> durationList = [
    "1 Minute",
    "10 Minutes",
    "1 Hour",
    "1.5 Hours",
  ];

  List<AgentHomeModel> agentHomeList = [
    AgentHomeModel(currentBiddingSUtil, kCurrentBidingScreen,
        Assets.bidIcon),
    AgentHomeModel(
        myWalletSUtil, kMyWalletScreen, Assets.walletIcon),
    AgentHomeModel(
        callHistorySUtil, kCallHistoryScreen, Assets.callHistoryIcon),
    AgentHomeModel(
        withdrawMoneySUtil, kWithdrawMoneyScreen, Assets.withdrawMoneyIcon),
  ];

  final FocusNode callFocusNode = FocusNode();

  TextEditingController callEditingController = TextEditingController();

  final LayerLink layerLink = LayerLink();

  Future<bool> onDashboardBack() async {
    return Get.dialog(CustomDialog(
      icon: Icons.logout,
      primaryLabel: yesSUtil,
      secondaryLabel: noSUtil,
      primaryTap: () => onDialogButton(true),
      title: exitAppSUtil,
      label: sureExitAppSUtil,
    )).then((value) => doBack);
  }

  onDialogButton(bool value) {
    doBack = value;
    Get.back();
  }

  onFindAgentTap() async {
    _updateProgress();
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeW(50), vertical: sizeH(90)),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          "Searching Agents...",
                          style: med18.copyWith(color: textGreyColor),
                        ))),
              ),
              const Center(
                  child: RipplesAnimation(
                color: Colors.white,
              )),
              Positioned(
                  bottom: sizeH(50),
                  child: SizedBox(
                      width: Get.width,
                      child: Obx(
                        () => LinearProgressIndicator(
                          color: accentColorSwatch,
                          value: _progressValue.value,
                        ),
                      ))),
            ],
          ),
        ),
      ),
    ).then((value) {
      _progressValue.value = 0.0;
    });
  }

  selectCallDuration() {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        const NumberPickerColumn(begin: 0, end: 24, suffix: Text(' hours')),
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' minutes'), jump: 15),
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: const Icon(Icons.more_vert),
          ),
        )
      ],
      hideHeader: true,
      confirmText: 'OK',
      confirmTextStyle:
          const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
      title: const Text('Select duration'),
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // You get your duration here
        // Duration duration = Duration(
        //     hours: picker.getSelectedValues()[0],
        //     minutes: picker.getSelectedValues()[1]);
      },
    ).showDialog(Get.context!);
  }

  void _updateProgress() {
    double duration = 3;
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      _progressValue.value += 1 / duration;
      // we "finish" downloading here
      if (_progressValue.value >= 1.0) {
        _progressValue.value = 0.0;
        t.cancel();
        Get.back();
        Get.toNamed(kAvailableAgentsScreen);

        return;
      }
    });
  }

  onAgentHomeNextRoute(int index) {
    Get.toNamed(agentHomeList[index].route);
  }
}
