import 'package:erinet_app/controller/my_wallet_controller.dart';
import 'package:erinet_app/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../controller/connect_call_controller.dart';
import '../controller/recharge_controller.dart';
import '../controller/call_history_controller.dart';
import '../controller/call_history_detail_controller.dart';
import '../controller/calling_controller.dart';
import '../controller/chat_controller.dart';
import '../controller/home_controller.dart';
import '../controller/login_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => CallingController());
    Get.lazyPut(() => RechargeController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CallHistoryController());
    Get.lazyPut(() => CallHistoryDetailController());
    Get.lazyPut(() => MyWalletController());
    Get.lazyPut(() => ConnectCallController());
    Get.lazyPut(() => ProfileController());
  }
}
