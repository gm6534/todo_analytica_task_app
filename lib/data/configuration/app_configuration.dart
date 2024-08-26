import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:get_storage/get_storage.dart';

import '../utils/constants/app_constants.dart';
import '../utils/widgets/common_widgets.dart';

class AppConfigurations {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await dot_env.dotenv.load();
    await GetStorage.init();
    await setSystemPreference();
  }

  static String get applicationName {
    var value = dot_env.dotenv.env["APP_NAME"] ?? AppInfo.appTitle;
    return value;
  }

  static String get aiBaseUrl {
    var value = dot_env.dotenv.env["AZURE_BASE_URL"] ?? "";
    return value;
  }

  static String get aiApiKey {
    var value = dot_env.dotenv.env["AZURE_API_KEY"] ?? "";
    return value;
  }

  static Future<void> setSystemPreference () async {
    setOrientationPortrait();
  }
}