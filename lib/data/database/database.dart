import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task_data.dart';

class AppDatabaseInfo {
  static const String databaseName = 'todo_list.db';
  static const int databaseVersion = 1;
}

class DatabaseInitializer {
  static Database? _database;

  static Future<void> initialize() async {
    _database = await _initDatabase();
    await _createTables(_database!, AppDatabaseInfo.databaseVersion);
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), AppDatabaseInfo.databaseName);
    return openDatabase(
      path,
      version: AppDatabaseInfo.databaseVersion,
      onCreate: (db, version) async {
        await _createTables(db, version);
      },
    );
  }

  static Future<void> _createTables(Database db, int version) async {
    await TaskData.createTable(db);
    // Create other tables if necessary
  }

  static Database? get database {
    return _database!;
  }

  static Future close() async {
    if (_database != null) await _database!.close();
  }

  static Future dropAllTables() async {
    final db = await _database!;
    await db.execute('DROP TABLE IF EXISTS tasks');
  }

  static Future deleteAllTables() async {
    await TaskData.deleteTable();
  }
}
