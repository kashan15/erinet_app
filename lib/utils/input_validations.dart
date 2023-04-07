import 'package:get/get.dart';

import 'string_utils.dart';


class InputValidations{

  static String? emailValidation(value) {
    if (!GetUtils.isEmail(value)) {
      return validEmailSUtil.tr;
    } else {
      return null;
    }
  }

  static String? passwordValidation(value) {
    if (value == null ||
        value.isEmpty ||
        value != value.replaceAll(RegExp(r"\s+"), "")) {
      return requiredSUtil.tr;
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < 3) {
      return requiredSUtil.tr;
    } else {
      return null;
    }
  }
  static String? signupPasswordValidation(value) {
    if (value == null ||
        value.isEmpty ||
        value != value.replaceAll(RegExp(r"\s+"), "")) {
      return requiredSUtil.tr;
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < 6) {
      return passwordLengthSUtil.tr;
    } else {
      return null;
    }
  }

  static String? commonValidation(value, {String? fieldName}) {
    if (value.trim() == null || value.trim().isEmpty ) {
      return fieldName != null ? "${fieldName.tr} ${isRequiredSUtil.tr}" : requiredSUtil.tr;
    }else {
      return null;
    }


  }

}

DateTime? getLocalDate(DateTime? dateTime) {
  var newDateTime = dateTime != null
      ? DateTime.utc(dateTime.year, dateTime.month, dateTime.day,
      dateTime.hour, dateTime.minute, dateTime.second)
      .toLocal()
      : null;

  return newDateTime;
}

String getUtcDate(String? dateTime) {

  return DateTime.tryParse(dateTime!)?.toUtc().toString() ?? dateTime;
}
DateTime? getUtcDateFromDate(DateTime? dateTime) {

  return DateTime.tryParse(dateTime!.toString())?.toUtc() ?? dateTime;
}