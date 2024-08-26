import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app_styles/app_sizes.dart';
import '../app_styles/app_text_styles.dart';
import 'colors_constant.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.appBarColorLight,
    scaffoldBackgroundColor: AppColors.bgColorPrimaryLight,
    appBarTheme: const AppBarTheme(
        // elevation: AppSize.defaultAppBarElevation,
        backgroundColor: AppColors.elevatedBTNColorLight,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.textColorWhite,
        ),
        iconTheme: IconThemeData(color: AppColors.textColorWhite),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.elevatedBTNColorLight,
            statusBarIconBrightness: Brightness.light)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(
          horizontal: GetPlatform.isDesktop ? 20 : 16,
          vertical: GetPlatform.isDesktop ? 20 : 14)),
      backgroundColor: WidgetStateProperty.all(AppColors.elevatedBTNColorLight),
      // foregroundColor: MaterialStateProperty.all(AppColors.bgColorPrimaryLight),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
    )),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      // padding: WidgetStateProperty.all(EdgeInsets.zero),
      // backgroundColor:
      //     WidgetStateProperty.all(AppColors.elevatedBTNColorLight),
      // foregroundColor: MaterialStateProperty.all(AppColors.bgColorPrimaryLight),
      shape: WidgetStateProperty.all(const CircleBorder()),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.elevatedBTNColorLight),
      side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.elevatedBTNColorLight)),
    )),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      filled: true,
      fillColor: AppColors.appLightPurple.withOpacity(0.4),
      labelStyle: AppTextStyle.secondaryTextStyle(),
      hintStyle: AppTextStyle.secondaryTextStyle()
          .copyWith(fontSize: 13, color: AppColors.hintColorWhite),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius_8),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius_8),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius_8),
        borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
      ),
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.appBarColorLight,
      onPrimary: AppColors.appBarColorLight,
      secondary: AppColors.elevatedBTNColorLight,
      onSecondary: AppColors.elevatedBTNColorLight,
      error: Colors.red,
      onError: Colors.red,
      background: AppColors.bgColorPrimaryLight,
      onBackground: AppColors.bgColorPrimaryLight,
      // surface: AppColors.appLightPurple.withOpacity(0.4),
      // onSurface: AppColors.appLightPurple.withOpacity(0.4)
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.elevatedBTNColorDark,
    scaffoldBackgroundColor: AppColors.bgColorPrimaryDark,
    appBarTheme: const AppBarTheme(
        // elevation: AppSize.defaultAppBarElevation,
        backgroundColor: AppColors.elevatedBTNColorDark,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.textColorWhite,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textColorWhite,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.elevatedBTNColorDark,
            statusBarIconBrightness: Brightness.dark)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(
          horizontal: GetPlatform.isDesktop ? 20 : 16,
          vertical: GetPlatform.isDesktop ? 20 : 14)),
      backgroundColor: WidgetStateProperty.all(AppColors.elevatedBTNColorDark),
      // foregroundColor: MaterialStateProperty.all(AppColors.appBarColorDark),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
    )),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      // padding: WidgetStateProperty.all(EdgeInsets.zero),
      // backgroundColor:
      // WidgetStateProperty.all(AppColors.elevatedBTNColorDark),
      // foregroundColor: MaterialStateProperty.all(AppColors.appBarColorDark),
      shape: WidgetStateProperty.all(const CircleBorder()),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.elevatedBTNColorDark),
      side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.elevatedBTNColorDark)),
    )),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      filled: true,
      fillColor: AppColors.appLightPurple.withOpacity(0.4),
      labelStyle: AppTextStyle.secondaryTextStyle(),
      hintStyle: AppTextStyle.secondaryTextStyle()
          .copyWith(fontSize: 13, color: AppColors.hintColorWhite),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius_8),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius_8),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius_8),
        borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.appBarColorLight,
      onPrimary: AppColors.appBarColorLight,
      secondary: AppColors.elevatedBTNColorLight,
      onSecondary: AppColors.elevatedBTNColorLight,
      error: Colors.red,
      onError: Colors.red,
      surface: AppColors.bgColorPrimaryLight,
      onBackground: AppColors.bgColorPrimaryLight,
      // surface: AppColors.appLightPurple.withOpacity(0.4),
      // onSurface: AppColors.appLightPurple.withOpacity(0.4)
    ),
  );
}
