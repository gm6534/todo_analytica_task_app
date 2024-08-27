import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_analytica_task_app/data/database/database.dart';
import 'package:todo_analytica_task_app/view_model/connectivity_controller.dart';
import 'package:todo_analytica_task_app/view/task/view_model/offlineController.dart';
import 'package:todo_analytica_task_app/view/task/view_model/task_controller.dart';

import '../../view_model/auth_controller.dart';
import '../../view_model/theme_controller.dart';
import '../utils/constants/app_constants.dart';
import '../utils/widgets/common_widgets.dart';

class AppConfigurations {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await DatabaseInitializer.initialize();
    await dot_env.dotenv.load();
    await GetStorage.init();
    await setSystemPreference();
    Get.put(OfflineController());
    Get.put(NetworkController());
    Get.put(ThemeController());
    Get.put(AuthController());
    Get.put(TaskController());
  }

  static String get applicationName {
    var value = dot_env.dotenv.env["APP_NAME"] ?? AppInfo.appTitle;
    return value;
  }

  static Future<void> setSystemPreference () async {
    setOrientationPortrait();
  }
}