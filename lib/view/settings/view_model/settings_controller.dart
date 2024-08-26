import 'package:get/get.dart';

import '../../../view_model/common_controller.dart';
import '../../../view_model/home_controllers/home_controller.dart';

class SettingController extends GetxController {
  final HomeController homeController = Get.find();
  final CommonController commonController = Get.find();
  var tempSelectedCategories = <String>[].obs;

  @override
  void onInit() {
    // tempSelectedCategories = homeController.selectedCategories;
    super.onInit();
  }

  // @override
  // void onClose() {
  //   tempSelectedCategories.clear();
  //   super.onClose();
  // }
}
