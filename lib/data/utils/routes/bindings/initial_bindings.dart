import 'package:get/get.dart';

import '../../../../view_model/common_controller.dart';
import '../../../../view_model/connectivity_controller.dart';
import '../../../../view_model/home_controllers/home_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CommonController());
  }
}
