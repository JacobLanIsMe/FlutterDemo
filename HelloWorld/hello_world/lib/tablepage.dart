import 'package:flutter/material.dart';

class Tablepage extends StatelessWidget {
  const Tablepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(50),
        2: FixedColumnWidth(100)
      },
      border: TableBorder.all(
        color: Colors.blue,
        width: 2,
      ),
      children: const [
        TableRow(children: [Text('課程名稱'), Text('講師'), Text('上課時間')]),
        TableRow(children: [Text('1'), Text('2'), Text('3')]),
      ],
    ));
  }
}
