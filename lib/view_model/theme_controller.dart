import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/utils/widgets/debug_print.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  late RxBool isDarkMode;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    RxBool isSystemDarkTheme = Get.isPlatformDarkMode.obs;
    var isThemeModeDark =
        _storage.read('isDarkMode') ?? isSystemDarkTheme.value;
    Debug.mLog("isDarkMode $isThemeModeDark");
    if (isThemeModeDark) {
      isDarkMode = true.obs;
    } else {
      isDarkMode = false.obs;
    }
  }

  void toggleTheme() {
    // Get.changeTheme(isDarkMode.value ? ThemeHelper.lightTheme : ThemeHelper.darkTheme);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = !isDarkMode.value;
    _storage.write('isDarkMode', isDarkMode.value);
    Debug.mLog(
        "isDarkMode ${_storage.read('isDarkMode') ?? false}");
  }
}
