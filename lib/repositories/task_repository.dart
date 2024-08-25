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

  Future<int> addTask(
      String name, String dueDate, int isComplete, int userId) async {
    final db = await DBHelper.getInstance();

    return await db.insert(
      'tasks',
      {
        'name': name,
        'dueDate': dueDate,
        'isComplete': isComplete,
        'userId': userId,
      },
    );
  }

/*
  Future<List<Map<String, dynamic>>> getTasksByUser(int userId) async {
    final db = await DBHelper.getInstance();

    return await db.query(
      'tasks',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }

  Future<int> updateTaskUserId(Map<String, dynamic> task) async {
    Database db = await DBHelper.getInstance();
    return await db.update(
      'tasks',
      task,
      where: 'id = ? AND userId = ?',
      whereArgs: [task['id'], task['userId']],
    );
  }

  Future<List<Map<String, dynamic>>> getTasksUserId(int userId) async {
    Database db = await DBHelper.getInstance();
    return await db.query(
      'tasks',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }

  Future<int> insertTaskUserId(Map<String, dynamic> task, int userId) async {
    Database db = await DBHelper.getInstance();
    task['userId'] = userId;
    return await db.insert('tasks', task);
  }

  Future<List<Map<String, dynamic>>> getTasksByUserId(int userId) async {
    Database db = await DBHelper.getInstance();
    return await db.query('tasks', where: 'userId = ?', whereArgs: [userId]);
  }
*/
}
