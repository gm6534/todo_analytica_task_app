import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/task_model.dart';
import '../view_model/task_controller.dart';
import 'add_edit_task_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final TaskController taskController = Get.find<TaskController>();

  TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Get.to(() => AddEditTaskScreen(task: task)),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              taskController.deleteTask(task.taskID);
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${task.category}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Description:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text(task.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text('Due Date: ${task.dueDate.toIso8601String()}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
