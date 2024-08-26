import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class AppSize {
  // Text Sizes
  static const double textSize16 = 16;
  static const double textBoldSizeGlobal = 16;
  static const double textPrimarySizeGlobal = 16;
  static const double textSecondarySizeGlobal = 14;
  static const FontWeight fontWeightBoldGlobal = FontWeight.bold;
  static const FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
  static const FontWeight fontWeightSecondaryGlobal = FontWeight.normal;

  // Elevation
  static const double defaultAppBarElevation = 4.0;
  static const double defaultAppButtonElevation = 4.0;

  // Radius
  static const double defaultRadius_8 = 8.0;
  static const double defaultRadius_4 = 4.0;
  static const double defaultBlurRadius = 4.0;
  static const double defaultSpreadRadius = 1.0;


  // Padding
  static EdgeInsets dynamicAppButtonPadding() {
    if (GetPlatform.isDesktop) {
      return EdgeInsets.symmetric(vertical: 20, horizontal: 20);
    } else if (!GetPlatform.isMobile && !GetPlatform.isDesktop) {
      return EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    } else {
      return EdgeInsets.symmetric(vertical: 14, horizontal: 16);
    }
  }

}