import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../model/call_history_model.dart';

class CallHistoryDetailController extends GetxController{
  CallHistoryModel callHistoryModel = CallHistoryModel();

  @override
  void onInit() {
    super.onInit();
    callHistoryModel = Get.arguments;

    if (kDebugMode) {
      print(callHistoryModel);
    }

  }

}