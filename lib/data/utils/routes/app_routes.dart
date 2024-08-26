import 'package:get/get.dart';

import '../../../view/authentication/authentication_screen.dart';
import '../../../view/home_view/home_screen.dart';
import '../../../view/settings/view/setting_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String authScreen = '/authScreen';
  static const String homeScreen = '/homeScreen';
  static const String settingScreen = '/settingScreen';


  static List<GetPage> pages = [
    GetPage(
      name: initial,
      page: () => AuthenticationScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: settingScreen,
      page: () => SettingScreen(),
    ),

  ];
}
