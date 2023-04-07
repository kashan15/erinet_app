import 'package:erinet_app/utils/route_utils.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/storage_utils.dart';

class PendingController{
  PendingController();


  static void getPending(){

    final GetStorage getStorage = GetStorage();
    late final String? pendingRoute;

    pendingRoute = getStorage.read(pendingPrefUtil);
    // if(pendingRoute != null){
    //   Get.toNamed(pendingRoute);
    // }
      Get.toNamed(kConnectCallScreen);
  }

}