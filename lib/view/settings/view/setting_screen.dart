import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utils/constants/app_string_constant.dart';
import '../../../data/utils/widgets/base_scaffold.dart';
import '../../../data/utils/widgets/locale_switcher.dart';
import '../../../view_model/home_controllers/home_controller.dart';
import '../../../view_model/theme_controller.dart';
import '../view_model/settings_controller.dart';
import 'components/settings_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final controller = Get.put(SettingController());
  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: AppStrings.settings.jsonName.tr,
      center: true,
      body: Column(
        children: [
          buildSettingsTile(
              context: context,
              optionName: AppStrings.language.jsonName.tr,
              optionAction: const LanguageSwitcher()),
          buildSettingsTile(
              context: context,
              optionName: AppStrings.themeMode.jsonName.tr,
              optionAction: GestureDetector(
                onTap: () => themeController.toggleTheme(),
                child: Obx(
                  () => Icon(themeController.isDarkMode.value
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded),
                ),
              )),
        ],
      ),
    );
  }
}
