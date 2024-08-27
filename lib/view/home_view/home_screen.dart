import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/extensions.dart';
import 'package:todo_analytica_task_app/view/quote_screen.dart';
import 'package:todo_analytica_task_app/view_model/auth_controller.dart';

import '../../data/utils/app_styles/app_text_styles.dart';
import '../../data/utils/constants/app_string_constant.dart';
import '../../data/utils/widgets/base_scaffold.dart';
import '../task/view_model/task_controller.dart';
import '../task/view/add_edit_task_screen.dart';
import '../task/view/task_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TaskController taskController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Get.defaultDialog(
            barrierDismissible: false,
            contentPadding: EdgeInsets.symmetric(vertical: 20.w),
            confirm: OutlinedButton(
              onPressed: () => exit(0),
              child: Text(AppStrings.exit.jsonName.tr),
            ),
            cancel: TextButton(
              onPressed: () => Get.back(),
              child: Text(AppStrings.back.jsonName.tr),
            ),
            title: AppStrings.exitConfirmation.jsonName.tr,
            titleStyle: AppTextStyle.boldTextStyle(color: Colors.black),
            content: Text(
              AppStrings.areYouSureWantExit.jsonName.tr,
              style: AppTextStyle.primaryTextStyle(color: Colors.black),
            ),
          );
        }
      },
      child: BaseScaffold(
        appBarTitle: '',
        showDrawer: true,
        body: Column(
          children: [
            Flexible(
                child: InkWell(
                  onTap: () {
                    Get.to(QuoteScreen());
                  },
                  child: Container(
                                height: 100.w,
                                width: double.infinity,
                                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.r)),
                                child: Text(
                  "Don't loose hope\nclick to see quote",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.boldTextStyle(color: Colors.teal),
                                ).center(),
                              ).paddingAll(10.w),
                )),
            Expanded(
              child: Obx(() {
                if (authController.isLoading.value) {
                  return CircularProgressIndicator(
                      color: Theme.of(context).appBarTheme.backgroundColor);
                } else if (taskController.tasks.isEmpty) {
                  return const Center(child: (Text('No tasks available.')));
                }
                return ListView.separated(
                  itemCount: taskController.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskController.tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.category),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          task.isCompleted = value!;
                          taskController.updateTask(task);
                        },
                      ),
                      onTap: () => Get.to(() => TaskDetailScreen(task: task)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0.w,
                      thickness: 1,
                      color: Colors.grey,
                    );
                  },
                );
              }).paddingAll(8.w),
            ),
          ],
        ),
        floatingButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => Get.to(() => AddEditTaskScreen()),
        ),
      ),
    );
  }
}
