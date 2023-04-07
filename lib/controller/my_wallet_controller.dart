import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/storage_utils.dart';


class MyWalletController extends GetxController {
  RxInt selectedPayment = 0.obs;
late final int userType;
  @override
  void onInit() {
    super.onInit();
    userType = GetStorage().read(userTypePrefUtil);
  }

  onSelectPayment(selected) {
    selectedPayment.value = selected;
    // setState(() {});
  }
}
