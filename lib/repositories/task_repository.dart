import 'package:my_tasks/repositories/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  Future<int> insertTask(Map<String, dynamic> task) async {
    Database db = await DBHelper.getInstance();
    return await db.insert('tasks', task);
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    Database db = await DBHelper.getInstance();
    return await db.query('tasks');
  }

  Future<int> updateTask(Map<String, dynamic> task) async {
    Database db = await DBHelper.getInstance();
    return await db.update(
      'tasks',
      task,
      where: 'id = ?',
      whereArgs: [task['id']],
    );
  }

  Future<int> deleteTask(int id) async {
    Database db = await DBHelper.getInstance();
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
