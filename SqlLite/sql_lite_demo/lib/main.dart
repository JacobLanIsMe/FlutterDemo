import 'package:flutter/material.dart';
import 'package:sql_lite_demo/database/manager/student_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){StudentManager.instance.insert();}, child: const Text('新增')),
              ElevatedButton(onPressed: (){update();}, child: const Text('修改')),
              ElevatedButton(onPressed: (){delete();}, child: const Text('刪除')),
              ElevatedButton(onPressed: (){StudentManager.instance.query();}, child: const Text('查詢')),
            ],
          ),
        )
      ),
    );
  }
}

void insert(){
  debugPrint('insert date');
}
void update(){

}
void delete(){

}
void select(){

}