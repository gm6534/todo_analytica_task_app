import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/extensions.dart';

import '../../../view_model/connectivity_controller.dart';
import '../app_styles/app_text_styles.dart';
import '../constants/app_string_constant.dart';
import 'common_app_bar.dart';
import 'common_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final Color? bgColor;
  final String appBarTitle;
  final bool center;
  final bool showDrawer;
  final Widget? body;
  final Widget? floatingButton;
  BaseScaffold({
    super.key,
    required this.appBarTitle,
    this.bgColor,
    this.body,
    this.center = true,
    this.showDrawer = false, this.floatingButton,
  });

  // final RxBool isHomeScreen = (Get.currentRoute == AppRoutes.homeScreen).obs;
  final networkController = Get.find<NetworkController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
      drawer: showDrawer ? CommonDrawer() : null,
      appBar: CommonAppBar(
        title: appBarTitle,
        center: center,
        // leadingWidget: leadingAppBarWidget,
        leadingWidget: showDrawer
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      onPressed: () {
                        // Debug.log(navigatorKey.currentState.toString());
                        // navigatorKey.currentState?.openDrawer();
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu));
                },
              )
            : null,
      ),
      body: Column(
        children: [
          if(networkController.offlineController.isSyncing.value)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.8)
            ),
            child: Text("Syncing Tasks", style: AppTextStyle.primaryTextStyle(color: Colors.white),).center().paddingSymmetric(vertical: 3.w),
          ),
          Expanded(child: body ?? const SizedBox.shrink()),
        ],
      ),
      // body: Obx(() => networkController.isConnected.value
      //     ? (body ?? const SizedBox.shrink())
      //     : Center(
      //         child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Icon(
      //             Icons.refresh,
      //             size: 70.w,
      //             color: Colors.grey.shade400,
      //           ),
      //           20.height,
      //           Text(NetworkMsgString.noInternet.jsonName.tr,
      //               style: AppTextStyle.primaryTextStyle(size: 20.sp)),
      //         ],
      //       ))),
      floatingActionButton: floatingButton,
    );
  }
}
