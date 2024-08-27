import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/api/api_services/auth_service.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/app_text_field.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/base_scaffold.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/common_buttons.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/extensions.dart';
import 'package:uuid/uuid.dart';

import '../model/task_model.dart';
import '../view_model/task_controller.dart';

class AddEditTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final Task? task;
  final _formKey = GlobalKey<FormState>();

  AddEditTaskScreen({super.key, this.task});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
      categoryController.text = task!.category;
      dueDateController.text = task!.dueDate.toIso8601String();
    }

    return BaseScaffold(
      appBarTitle: task == null ? 'Add Task' : 'Edit Task',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ).paddingSymmetric(vertical: 10.w),
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ).paddingSymmetric(vertical: 10.w),
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              controller: categoryController,
              decoration: const InputDecoration(hintText: 'Category'),
            ).paddingSymmetric(vertical: 10.w),
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              controller: dueDateController,
              decoration: const InputDecoration(hintText: 'Due Date (YYYY-MM-DD)'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a due date';
                }
                return null;
              },
            ).paddingSymmetric(vertical: 10.w),
            const SizedBox(height: 20),
            CommonFlatButton(
              title: task == null ? 'Add Task' : 'Update Task',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (task == null) {
                    final newTask = Task(
                      taskID: const Uuid().v4(),
                      userID: AuthService.auth.currentUser!.uid,
                      title: titleController.text,
                      description: descriptionController.text,
                      category: categoryController.text,
                      dueDate: DateTime.parse(dueDateController.text),
                    );
                    taskController.addTask(newTask);
                  } else {
                    task!.title = titleController.text;
                    task!.description = descriptionController.text;
                    task!.category = categoryController.text;
                    task!.dueDate = DateTime.parse(dueDateController.text);
                    taskController.updateTask(task!);
                  }
                  Get.back();
                }
              },
            ).withWidth(double.infinity),
          ],
        ).paddingAll(15.w),
      ),
    );
  }
}
