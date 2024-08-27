import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/api/api_services/auth_service.dart';
import 'package:todo_analytica_task_app/data/utils/constants/app_constants.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/extensions.dart';
import 'package:todo_analytica_task_app/view_model/auth_controller.dart';
import '../app_styles/app_text_styles.dart';
import '../constants/app_image_constant.dart';
import '../routes/app_routes.dart';
import 'asset_image_view.dart';

class CommonDrawer extends StatelessWidget {
  CommonDrawer({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Text(AppInfo.appTitle, style: AppTextStyle.boldTextStyle(color: Colors.white, size: 20.sp),)
                    .paddingSymmetric(vertical: 20)
                    .center(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32.r,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Icon(Icons.person, color: Theme.of(context).appBarTheme.backgroundColor, size: 20.w,),
                    ),
                    20.width,
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AuthService.auth.currentUser?.displayName ?? "",
                          style: AppTextStyle.boldTextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ).fit(),
                        Text(
                          AuthService.auth.currentUser?.email ?? "",
                          style: AppTextStyle.primaryTextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ).fit(),
                      ],
                    ).flexible(),
                  ],
                ).paddingSymmetric(horizontal: 20, vertical: 15),
                const Divider(),
              ],
            ),
            ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  title: Text(
                    item.title,
                    style: AppTextStyle.primaryTextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  onTap: () async {
                    Scaffold.of(context).closeDrawer();
                    if(item.route == AppRoutes.authScreen) {
                      await controller.signOut();
                    }
                    Get.toNamed(item.route);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.4),
                  height: 0,
                );
              },
            ).flexible(),
            Column(
              children: [
                Text(
                  "© GM Productions 2024",
                  style: AppTextStyle.secondaryTextStyle(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.4)),
                ).fit(),
                Text(
                  "Version 1.0.0",
                  style: AppTextStyle.secondaryTextStyle(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.4)),
                ).fit(),
              ],
            ).center().paddingSymmetric(vertical: 10)
          ],
        ),
      ),
    );
  }
}

class DrawerItemDataModel {
  final IconData icon;
  final String title;
  final String route;

  DrawerItemDataModel({
    required this.icon,
    required this.title,
    required this.route,
  });
}

List<DrawerItemDataModel> items = [
  DrawerItemDataModel(icon: Icons.settings, title: 'Settings', route: AppRoutes.settingScreen),
  DrawerItemDataModel(icon: Icons.exit_to_app, title: 'Logout', route: AppRoutes.authScreen),
];
