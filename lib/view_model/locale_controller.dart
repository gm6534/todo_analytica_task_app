import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/locales/en_json.dart';
import '../data/locales/ur_json.dart';

class LocalizationService extends Translations {
  static Locale get locale => Get.deviceLocale!;

  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ur', 'PK'),
  ];

  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'ur_PK': ur,
      };

  static Map<String, String> get en => english(localeIndex: 0);

  static Map<String, String> get ur => urdu(localeIndex: 1);

  static void changeLocale(
      {String langCode = 'en', String countryCode = 'US'}) {
    final locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
  }
}
