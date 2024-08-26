import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../model/task_model.dart';
import 'database.dart';

class TaskData {
  static const String tableName = 'tasks';

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
    String taskJson = task.toJson().toString(); // Convert task to JSON string
    await db?.insert(
      tableName,
      {'Id': task.id, 'json': taskJson},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Task>> getTasks() async {
    final db = await DatabaseInitializer.database;
    final List<Map<String, dynamic>> maps = await db!.query(tableName);

    return List.generate(maps.length, (i) {
      Map<String, dynamic> taskMap = jsonDecode(maps[i]['json']);
      return Task.fromJson(taskMap);
    });
  }

  static Future<void> updateTask(Task task) async {
    final db = await DatabaseInitializer.database;
    String taskJson = task.toJson().toString();
    await db?.update(
      tableName,
      {'json': taskJson},
      where: 'Id = ?',
      whereArgs: [task.id],
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
