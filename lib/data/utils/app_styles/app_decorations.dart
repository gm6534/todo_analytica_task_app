import 'package:flutter/material.dart';

import 'app_sizes.dart';


class AppDecoration {

  /// returns Radius
  static BorderRadius bRadius([double? radius]) {
    return BorderRadius.all(Radius.circular(radius ?? AppSize.defaultRadius_8));
  }

  /// default box decoration for container
  static Decoration boxDecorationDefault({
    required BuildContext context,
    BorderRadiusGeometry? borderRadius,
    Color? color,
    Gradient? gradient,
    BoxBorder? border,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    List<BoxShadow>? boxShadow,
    DecorationImage? image,
  }) {
    return BoxDecoration(
      borderRadius: (shape != null && shape == BoxShape.circle)
          ? null
          : (borderRadius ?? bRadius()),
      boxShadow: boxShadow ?? defaultBoxShadow(),
      color: color ?? Theme.of(context).scaffoldBackgroundColor,
      gradient: gradient,
      border: border,
      shape: shape ?? BoxShape.rectangle,
      backgroundBlendMode: backgroundBlendMode,
      image: image,
    );
  }



  /// default box shadow
  static List<BoxShadow> defaultBoxShadow({
    Color? shadowColor,
    double? blurRadius,
    double? spreadRadius,
    Offset offset = const Offset(0.0, 0.0),
  }) {
    return [
      BoxShadow(
        color: shadowColor ?? Colors.grey.withOpacity(0.2),
        blurRadius: blurRadius ?? AppSize.defaultBlurRadius,
        spreadRadius: spreadRadius ?? AppSize.defaultSpreadRadius,
        offset: offset,
      )
    ];
  }


  static InputDecoration inputDecoration(
      {
        Widget? prefixIcon,
        Widget? suffixIcon,
        String? hintText,
        String? labelText,
        EdgeInsetsGeometry? contentPadding,
      }) {
    return InputDecoration(
      contentPadding: contentPadding ?? const EdgeInsets.only(left: 16, right: 16),
      hintText: hintText,
      labelText: labelText,
      alignLabelWithHint: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }


}