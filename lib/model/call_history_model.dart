import 'dart:convert';

CallHistoryModel callHistoryModelFromJson(String str) =>
    CallHistoryModel.fromJson(json.decode(str));

String callHistoryModelToJson(CallHistoryModel data) =>
    json.encode(data.toJson());

class CallHistoryModel {
  CallHistoryModel({
    this.name,
    this.phoneNumber,
    this.datetime,
    this.time,
    this.callType,
  });

  String? name;
  String? phoneNumber;
  String? datetime;
  String? time;
  CallType? callType;

  factory CallHistoryModel.fromJson(Map<String, dynamic> json) =>
      CallHistoryModel(
        name: json["name"],
        phoneNumber: json["phone_number"],
        datetime: json["datetime"],
        time: json["time"],
        callType: json["call_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "datetime": datetime,
        "time": time,
        "call_type": callType,
      };
}

enum CallType{
  none,
  missedCall,
  outgoingCall,
  answeredCall,
  completedCall,
  inCompletedCall,
}
