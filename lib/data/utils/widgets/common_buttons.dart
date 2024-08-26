import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/extensions.dart';

import '../../../view_model/common_widgets_controller/app_button_controller.dart';
import '../app_styles/app_text_styles.dart';

class ScaleDownAnimation extends StatelessWidget {
  final Widget child;
  ScaleDownAnimation({
    super.key,
    required this.child,
  });

  final ScaleDownAnimationController controller =
      Get.put(ScaleDownAnimationController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        controller.startAnimation();
      },
      onPointerUp: (details) {
        controller.reverseAnimation();
      },
      child: Obx(() {
        return Transform.scale(
          scale: controller.scale.value,
          child: child,
        );
      }),
    );
  }
}

class CommonFlatButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color? btnColor;

  const CommonFlatButton({
    super.key,
    required this.onTap,
    required this.title, this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleDownAnimation(
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(btnColor),
        ),
        child: Text(
          title,
          style: AppTextStyle.boldTextStyle(
              color: Theme.of(context).colorScheme.surface),
        ),
      ),
    );
  }
}

class CommonAppIconButton extends StatelessWidget {
  final Function() onPressed;
  final bool expandedText;
  final String icon;
  final String? text;
  final double? iconHeight;
  final double? iconWidth;

  const CommonAppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.text,
    this.iconHeight,
    this.iconWidth,
    this.expandedText = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleDownAnimation(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          text!.validate(),
          style: AppTextStyle.boldTextStyle(size: 14.sp, color: Colors.white),
        ).fit(),
        icon: Image.asset(icon,
            height: iconHeight ?? 14.h,
            width: iconWidth ?? 14.w,
            color: Colors.white),
      ),
    );
  }
}

class CommonTextButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final double hPadding;
  final double vPadding;
  final double? fontSize;
  const CommonTextButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.hPadding = 0.0,
      this.vPadding = 0.0,
      this.fontSize});

  // final ScaleDownAnimationController controller = Get.put(ScaleDownAnimationController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    return ScaleDownAnimation(
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: AppTextStyle.boldTextStyle(
              size: fontSize?.sp,
              color: Theme.of(context).scaffoldBackgroundColor),
        ).paddingSymmetric(horizontal: hPadding.w, vertical: vPadding.h),
      ),
    );
  }
}

class TextIcon extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final int spacing;
  final int? maxLine;
  final Function()? onTap;
  final EdgeInsets? edgeInsets;
  final bool useMarquee;
  final BoxDecoration? boxDecoration;

  TextIcon({
    this.text,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.spacing = 4,
    this.maxLine,
    this.onTap,
    this.edgeInsets,
    this.useMarquee = false,
    this.boxDecoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Container(
        // padding: edgeInsets ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: boxDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            prefix != null
                ? Row(children: [prefix!, spacing.width])
                : const SizedBox(),

            buildText(),
            suffix != null
                ? Row(children: [spacing.width, suffix!])
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  /// build Text widget
  Widget buildText() {
    return Text(
      text.validate(),
      style: textStyle ?? AppTextStyle.primaryTextStyle(),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
