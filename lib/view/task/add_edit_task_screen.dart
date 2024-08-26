import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../model/task_model.dart';
import '../../view_model/task_controller.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: dueDateController,
                decoration: const InputDecoration(labelText: 'Due Date (YYYY-MM-DD)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a due date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(task == null ? 'Add Task' : 'Update Task'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (task == null) {
                      final newTask = Task(
                        id: const Uuid().v4(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
