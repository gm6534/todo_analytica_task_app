import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/locale_controller.dart';
import '../app_styles/app_text_styles.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
      icon: Text(
        (Get.locale?.languageCode == 'en' ? 'ur' : 'en').toUpperCase(),
        style: AppTextStyle.boldTextStyle()
      ),
      onPressed: () {
        // String newLocale = Get.locale?.languageCode == 'en' ? 'ur' : 'en';
        // LocalizationService.changeLocale(langCode: newLocale, countryCode: 'PK');

        debugPrint("-------${LocalizationService.locale.languageCode}-----------");
        debugPrint("-------${LocalizationService.locale.countryCode}-----------");

        int index = 0;
        if(Get.locale?.languageCode == LocalizationService.locale.languageCode) {
          index = 1;
        } else {
          index = 0;
        }
        LocalizationService.changeLocale(
            langCode: LocalizationService.supportedLocales[index].languageCode,
            countryCode: LocalizationService.supportedLocales[index].countryCode!);
      },
    );
  }
}
