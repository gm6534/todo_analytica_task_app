import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../view/task/model/task_model.dart';
import 'database.dart';

class TaskData {
  static const String tableName = 'Tasks';

  static Future<void> createTable(Database db) async {
    try {
      String creationTable = '''
        CREATE TABLE IF NOT EXISTS $tableName (
          Id TEXT PRIMARY KEY,
          json TEXT
        )
      ''';
      await db.execute(creationTable);
      print("Created table $tableName successfully.");
    } catch (e) {
      print("Create $tableName Table: $e");
    }
  }

  static Future<void> insertTask(Task task) async {
    final db = await DatabaseInitializer.database;
    String taskJson = jsonEncode(task.toJson());
    await db?.insert(
      tableName,
      {'Id': task.taskID, 'json': taskJson},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Task>> getTasks() async {
    final db = await DatabaseInitializer.database;
    // final List<Map<String, dynamic>> maps = await db!.query(tableName);
    final maps = await db!.query(tableName);

    return List.generate(
        maps.length, (i) {
      Map<String, dynamic> taskMap = jsonDecode(maps[i]['json'] as String);
      return Task.fromJson(taskMap);
    });
  }

  static Future<void> updateTask(Task task) async {
    final db = await DatabaseInitializer.database;
    String taskJson = jsonEncode(task.toJson());
    await db?.update(
      tableName,
      {'json': taskJson},
      where: 'Id = ?',
      whereArgs: [task.taskID],
    );
  }

  static Future<void> deleteTask(String id) async {
    final db = await DatabaseInitializer.database;
    await db?.delete(
      tableName,
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> deleteTable() async {
    final db = await DatabaseInitializer.database;
    await db?.execute('DELETE FROM $tableName');
  }
}
