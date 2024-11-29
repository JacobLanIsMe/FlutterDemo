import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 147, 229, 250),
              brightness: Brightness.dark,
              surface: const Color.fromARGB(255, 42, 51, 59)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
        ),
        body: ListView.builder(itemBuilder: (context, index) => Row(
          children: [
            Container(width: 10, height: 10, color: groceryItems[index].category.color,),
            Text(groceryItems[index].name),
            const Spacer(),
            Text(groceryItems[index].quantity.toString())
          ],
        )),
      ),
    );
  }
}
