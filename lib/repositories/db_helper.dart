import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static late Database _instance;
  static const String nameDataBase = 'tasks.db';

  static Future<Database> getInstance() async {
    String dataBasePath = await getDatabasesPath();
    var path = dataBasePath + nameDataBase;
    _instance = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onOpen: _onOpen,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
    );
    return _instance;
  }

  static void _onCreate(Database dataBase, int view) async {
    debugPrint('Criando a tabela Tasks');
    await dataBase.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            dueDate TEXT,
            isComplete INTEGER
          )
          ''');
    debugPrint('Criando a tabela Users');
    await dataBase.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  static void _onOpen(Database dataBase) async {
    debugPrint('Versão do Banco: ${await dataBase.getVersion()}');
  }

  static void _onUpgrade(
      Database dataBase, int oldVersion, int newVersion) async {
    debugPrint('Fazendo Upgrade do Banco: $oldVersion para $newVersion');
  }

  static void _onDowngrade(
      Database dataBase, int oldVersion, int newVersion) async {
    debugPrint('Fazendo Downgrade do Banco: $oldVersion para $newVersion');
  }
}
