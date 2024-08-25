import 'package:my_tasks/repositories/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  Future<int> registerUser(String username, String password) async {
    final db = await DBHelper.getInstance();

    try {
      return await db.insert(
        'users',
        {'username': username, 'password': password},
      );
    } catch (e) {
      return -1;
    }
  }

  Future<void> createUser(String username, String password) async {
    final db = await DBHelper.getInstance();
    try {
      await db.insert(
        'users',
        {'username': username, 'password': password},
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw Exception(
            'O nome de usuário já existe. Por favor, escolha outro.');
      } else {
        throw Exception('Erro ao criar usuário: $e');
      }
    }
  }

  Future<Map<String, dynamic>?> authenticateUser(
      String username, String password) async {
    final db = await DBHelper.getInstance();
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (users.isNotEmpty) {
      return users.first;
    }

    return null;
  }
}
