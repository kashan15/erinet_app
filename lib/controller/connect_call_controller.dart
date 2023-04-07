import 'package:erinet_app/components/new_custom_dialog.dart';
import 'package:erinet_app/utils/route_utils.dart';
import 'package:get/get.dart';

class ConnectCallController extends GetxController {
  @override
  onInit() {
    super.onInit();
    onStartCallInit();
  }

  onStartCallInit() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.dialog(
      CustomOverlayX(
        title: "Incorrect Number",
        label: "The number you have dialed seems incorrect",
        primaryLabel: "Redial",
        secondaryLabel: "Open Chat",
        primaryTap: () {
          Get.back();
        },
        secondaryTap: () async {
          await Get.toNamed(kChatScreen);
          Get.back();
        },
      ),
    );
  }

  void onStartCall(){

  }
}
