import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_styles/app_text_styles.dart';
import '../constants/app_image_constant.dart';
import 'asset_image_view.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool center;
  final Color? textColor;
  final double? textSize;
  final Widget? leadingWidget;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;

  const CommonAppBar({super.key,
    required this.title,
    this.actions,
    this.center = false,
    this.textColor,
    this.textSize,
    this.leadingWidget,
    this.titleTextStyle,
    this.bottom,
    this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: center,
      title: title.isNotEmpty
          ? Text(
        title,
        style: titleTextStyle ??
            (AppTextStyle.boldTextStyle(color: textColor, size: textSize ?? 20.sp)),
      )
          : AssetImageView(
        imagePath: AppImagePath.appIconLargeSvg,
        width: 180.w,
      ),
      actions: actions,
      automaticallyImplyLeading: false,
      leading: leadingWidget ?? BackButton(color: textColor),
      // leading: showBackButton ? (leadingWidget ?? BackButton(color: textColor)) : null,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}


//
// AppBar commonAppBar({
//   required final BuildContext context,
//   required final String title,
//   List<Widget>? actions,
//   bool center = false,
//   Color? textColor,
//   double textSize = 20,
//   Widget? leadingWidget,
//   TextStyle? titleTextStyle,
//   PreferredSizeWidget? bottom,
//   Widget? flexibleSpace,
// }) {
//   return AppBar(
//     centerTitle: center,
//     title: title.isNotEmpty
//         ? Text(
//             title,
//             style: titleTextStyle ??
//                 (AppTextStyle.boldTextStyle(color: textColor, size: textSize)),
//           )
//         : AssetImageView(
//             imagePath: AppImagePath.appIconLargeSvg,
//             width: 180.h,
//           ),
//     actions: actions,
//     automaticallyImplyLeading: false,
//     leading: leadingWidget ?? BackButton(color: textColor),
//     // leading: showBackButton ? (leadingWidget ?? BackButton(color: textColor)) : null,
//     bottom: bottom,
//     flexibleSpace: flexibleSpace,
//   );
// }
