import 'package:flutter/material.dart';

import '../constants/app_image_constant.dart';

class AssetImageView extends StatelessWidget {
  const AssetImageView({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.scale,
    this.fit,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return _getView();
  }

  Widget _getView() {
    String mimType = imagePath.split(".").last;
    String path = imagePath;
    // String path = "images/$fileName";

    if (mimType.isEmpty) {
      return Image.asset(
        AppImagePath.noImagePlaceHolder,
        height: height,
        width: width,
        color: color,
      );
    }

    switch (mimType) {
      case "png":
      case "jpg":
      case "jpeg":
        return Image.asset(
          path,
          height: height,
          width: width,
          color: color,
          scale: scale,
          fit: fit,
        );
      default:
        return Image.asset(
          AppImagePath.noImagePlaceHolder,
          height: height,
          width: width,
          color: color,
        );
      //   Icon(
      //   Icons.image_not_supported_outlined,
      //   size: width,
      //   color: color,
      // );
    }
  }
}
