import 'dart:convert';

import '../utils/input_validations.dart';

ChatModel supportChatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String supportChatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.data,
    this.status,
    this.message,
  });

  List<ChatData>? data;
  int? status;
  String? message;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    data: json["data"] == null ? [] : List<ChatData>.from(json["data"]!.map((x) => ChatData.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class ChatData {
  ChatData({
    this.id,
    this.senderId,
    this.receiverId,
    this.message,
    this.status,
    this.viewed,
    this.senderType,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? senderId;
  String? receiverId;
  String? message;
  String? status;
  String? viewed;
  String? senderType;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
    id: json["id"].toString(),
    senderId: json["sender_id"].toString(),
    receiverId: json["receiver_id"].toString(),
    message: json["message"].toString(),
    status: json["status"].toString(),
    viewed: json["viewed"].toString(),
    senderType: json["sender_type"].toString(),
      // getLocalDate(DateTime.tryParse(json["pickup_date"].toString()))
    createdAt: json["created_at"] == null ? null : getLocalDate(DateTime.tryParse(json["created_at"].toString())),
    updatedAt: json["updated_at"] == null ? null : getLocalDate(DateTime.tryParse(json["updated_at"].toString())),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "message": message,
    "status": status,
    "viewed": viewed,
    "sender_type": senderType,
    "created_at": getUtcDateFromDate(createdAt),//?.toIso8601String(),
    "updated_at": updatedAt,
  };
}
