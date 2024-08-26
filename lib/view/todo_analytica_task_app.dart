import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/utils/constants/app_constants.dart';
import '../data/utils/routes/app_routes.dart';
import '../data/utils/routes/bindings/initial_bindings.dart';
import '../data/utils/theme/theme_helper.dart';
import '../view_model/auth_controller.dart';
import '../view_model/locale_controller.dart';
import '../view_model/theme_controller.dart';

class ToDoAnalyticaTaskApp extends StatelessWidget {
  ToDoAnalyticaTaskApp({super.key});

  final themeController = Get.put(ThemeController());
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => Obx(() => GetMaterialApp(
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
                overscroll: false, physics: const BouncingScrollPhysics()),
            title: AppInfo.appTitle,
            theme: ThemeHelper.lightTheme,
            darkTheme: ThemeHelper.darkTheme,
            themeMode: themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light,
            getPages: AppRoutes.pages,
            initialRoute: authController.initialRoute(),
            translations: LocalizationService(),
            locale: LocalizationService.locale,
            fallbackLocale: LocalizationService.fallbackLocale,
            initialBinding: InitialBindings(),
          )),
    );
  }
}
