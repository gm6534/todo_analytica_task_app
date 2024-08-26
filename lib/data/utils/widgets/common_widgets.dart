import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// RichTextWidget
class RichTextWidget extends StatelessWidget {
  final List<TextSpan> list;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;
  final Locale? locale;

  RichTextWidget({
    required this.list,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.textDirection,
    this.strutStyle,
    this.locale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: list),
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.left,
      textDirection: textDirection,
      strutStyle: strutStyle,
      locale: locale,
    );
  }
}

/// Set SystemChrome UI Style
void setSystemChromeUI({
  Color? stbColor,
  Color? synColor,
  Brightness? stbBrightness,
  Brightness? stbIconBrightness,
  Brightness? synIconBrightness,
}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: stbColor,
    systemNavigationBarColor: synColor,
    statusBarBrightness: stbBrightness,
    statusBarIconBrightness: stbIconBrightness,
    systemNavigationBarIconBrightness: synIconBrightness,
  ));
}

/// Set orientation to portrait
void setOrientationPortrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

/// Set orientation to landscape
void setOrientationLandscape() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
