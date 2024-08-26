import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/utils/app_styles/app_text_styles.dart';
import '../../data/utils/constants/app_string_constant.dart';
import '../../data/utils/widgets/base_scaffold.dart';
import '../../view_model/home_controllers/home_controller.dart';
import '../../view_model/task_controller.dart';
import '../task/add_edit_task_screen.dart';
import '../task/task_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();
  final TaskController taskController = Get.put(TaskController());

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
        body: Obx(() {
          if (taskController.tasks.isEmpty) {
            return const Center(child: Text('No tasks available.'));
          }
          return ListView.builder(
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
          );
        }).paddingAll(8.w),
        floatingButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Get.to(() => AddEditTaskScreen()),
        ),
      ),
    );
  }
}
