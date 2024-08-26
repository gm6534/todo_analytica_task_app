import 'package:flutter/material.dart';
import 'data/configuration/app_configuration.dart';
import 'view/todo_analytica_task_app.dart';

Future<void> main() async {
  await AppConfigurations.initialize();
  runApp(ToDoAnalyticaTaskApp());
}
