import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'MyDatabase.db';
  static const _databaseVersion = 1;
  static const table = 'my_table';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  FutureOr _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      score INTEGER NOT NULL
      )
    ''');
  }
  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    if (db != null){
      return await db.insert(table, row);
    }
    else{
      return null;
    }
  }
  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    if (db == null) return null;
    return db.query(table);
  }
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    if (db == null) return null;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  Future<int?> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    if (db == null) return null;
    int id = row['id'];
    return await db.update(table, row, where: 'id = $id', whereArgs: [id]);
  }
  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    if (db == null) return null;
    return await db.delete(table, where: 'id = $id', whereArgs: [id]);
  }
}
