import 'package:get/get.dart';

import '../components/custom_widgets.dart';

class CallingController extends GetxController{
  RxDouble declineButtonX = sizeW(30).obs;
  RxDouble declineButtonY = 0.0.obs;
  RxDouble acceptButtonX = sizeW(120).obs;
  RxDouble acceptButtonY = 0.0.obs;

  RxBool showButton = true.obs;
}