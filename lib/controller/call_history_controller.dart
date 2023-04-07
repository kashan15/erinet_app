import 'package:erinet_app/utils/storage_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/call_history_model.dart';
import '../utils/route_utils.dart';

class CallHistoryController extends GetxController {
  /*final List<String> callTypeList = [
    'All Calls',
    'Missed Calls',
    'Outgoing Calls',
    'Answered Call'
  ];*/

  late final List<Map<CallType, String>> callTypeList;
  final List<CallHistoryModel> historyList = <CallHistoryModel>[
    CallHistoryModel(
        name: "john",
        callType: CallType.missedCall,
        phoneNumber: "+44 1234567890",
        datetime: "1:03 PM",
        time: "00hour 00min"),
    CallHistoryModel(
        name: "Andrew",
        callType: CallType.answeredCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "Mike",
        callType: CallType.outgoingCall,
        phoneNumber: "+44 1234567890",
        datetime: "4:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "john",
        callType: CallType.missedCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "00hour 00min"),
    CallHistoryModel(
        name: "Andrew",
        callType: CallType.answeredCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "Mike",
        callType: CallType.outgoingCall,
        phoneNumber: "+44 1234567890",
        datetime: "4:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "john",
        callType: CallType.missedCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "00hour 00min"),
    CallHistoryModel(
        name: "Andrew",
        callType: CallType.answeredCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "Mike",
        callType: CallType.outgoingCall,
        phoneNumber: "+44 1234567890",
        datetime: "4:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "Mike",
        callType: CallType.inCompletedCall,
        phoneNumber: "+44 1234567890",
        datetime: "4:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "john",
        callType: CallType.completedCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "00hour 00min"),
    CallHistoryModel(
        name: "Andrew",
        callType: CallType.inCompletedCall,
        phoneNumber: "+44 1234567890",
        datetime: "2:00 pm",
        time: "01hour 20min"),
    CallHistoryModel(
        name: "Mike",
        callType: CallType.completedCall,
        phoneNumber: "+44 1234567890",
        datetime: "4:00 pm",
        time: "01hour 20min"),
  ];

  RxList<CallHistoryModel> historyFilteredList = <CallHistoryModel>[].obs;

  late Map<CallType, String>? selectedCallType;

  final GetStorage _getStorage = GetStorage();

  late final int userType;

  @override
  void onInit() {
    super.onInit();
    // selectedCallType = {CallType.outgoingCall: 'Outgoing Calls'};
    // selectedCallType =callTypeList[0].keys.toString().obs;
    // selectedCallType = callTypeList[0].values.single.toString().obs;
    userType = _getStorage.read(userTypePrefUtil);
    // @Todo just For Prototype

    callTypeList = (userType == 1
        ? [
            {CallType.none: 'All Calls'},
            {CallType.completedCall: 'Completed Calls'},
            {CallType.inCompletedCall: 'In-completed Calls'},
          ]
        : [
            {CallType.none: 'All Calls'},
            {CallType.missedCall: 'Missed Calls'},
            {CallType.outgoingCall: 'Outgoing Calls'},
            {CallType.answeredCall: 'Answered Call'}
          ]);

    // historyList.removeWhere((e) => e.callType == CallType.inCompletedCall);

    // @Todo just For Prototype
    historyList.removeWhere(
      (e) => (userType == 2
          ? e.callType == CallType.inCompletedCall ||
              e.callType == CallType.completedCall
          : e.callType == CallType.missedCall ||
              e.callType == CallType.outgoingCall ||
              e.callType == CallType.answeredCall),
    );

    // callTypeList.forEach((xyz));
    selectedCallType = callTypeList[0];
    historyFilteredList.addAll(historyList);
  }

  // xyz(Map<CallType, String> x) {
  //   print(x.keys.single);
  // }

  void onCallTypeChanged(Map<CallType, String>? value) {
    if (kDebugMode) {
      print(value);
    }

    historyFilteredList.value = <CallHistoryModel>[];
    selectedCallType = value!;
    if (value.keys.single == CallType.none) {
      historyFilteredList.addAll(historyList);
    } else {
      historyFilteredList
          .addAll(historyList.where((e) => e.callType == value.keys.single));
    }
  }

  onTap(int index) {
    Get.toNamed(kCallHistoryDetailScreen,
        arguments: historyFilteredList[index]);
  }
}
