import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaleDownAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  var scale = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.addListener(() {
      scale.value = scaleAnimation.value;
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void startAnimation() {
    animationController.forward();
  }

  void reverseAnimation() {
    animationController.reverse();
  }
}