import 'package:flutter/material.dart';
import 'package:sql_lite_demo/database/data/student.dart';
import 'package:sql_lite_demo/database/database_helper.dart';

class StudentManager {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  StudentManager._privateConstructor(); // Singleton 單例模式，確保一個類別只有一個實例
  static StudentManager instance = StudentManager._privateConstructor();

  void insert() async {
    var student = Student(name: 'Jacob', score: 99, id: 1);
    dbHelper.insert(student.toMap());
    debugPrint('insert 結束');
  }

  void query() async {
    var rows = await dbHelper.queryAllRows();
    debugPrint('查詢結果:');
    if (rows == null) return;
    for (var i in rows) {
      debugPrint(i as String?);
    }
    debugPrint('query 結束');
  }

  void update() async {
    var student = Student(id: 1, name: 'Jacob', score: 100);
    dbHelper.update(student.toMap());
  }
  void delete() async {
    var id = await dbHelper.queryRowCount();
    if (id == null) return;
    dbHelper.delete(id);
    print('delete 結束');
  }
}
