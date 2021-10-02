import 'package:note_application_flutter/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) async {
          print("Creating a new database one");
          return await db.execute(
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT,title STRING,note TEXT,date STRING,startTime STRING,endTime STRING,remind INTEGER,repeat STRING,color INTEGER,isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int?> insert(Task? task) async {
    print("insert function called");
    await initDb();

    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Task>> getTaskList() async {
    await initDb();
    final List<Map<String, dynamic>> maps = await _db!.query('task');
    return List.generate(
      maps.length,
      (index) {
        return Task(
          id: maps[index]['id'],
          title: maps[index]['title'],
          date: maps[index]['date'],
          note: maps[index]['note'],
          isCompleted: maps[index]['isCompleted'],
          startTime: maps[index]['startTime'],
          endTime: maps[index]['endTime'],
          color: maps[index]['color'],
          remind: maps[index]['remind'],
          repeat: maps[index]['repeat'],
        );
      },
    );
  }
}
