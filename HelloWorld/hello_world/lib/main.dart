import 'package:flutter/material.dart';
import 'package:hello_world/gridview_page.dart';
import 'package:hello_world/listview_page.dart';
import 'package:hello_world/stack_page.dart';
import 'package:hello_world/tablepage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;
  List<Widget> pages = [const StackPage(), ListviewPage(), const GridviewPage(), const Tablepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drawer'),
        ),
        body: pages[currentIndex],
        drawer: Drawer(
          child: ListView(
            children: buildDrawerList(pages)
          ),
        ));
  }

  void onItemClick(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pop(context);
  }

  List<Widget> buildDrawerList(List<Widget> pages) {
    List<Widget> drawerList = [];
    drawerList.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text('Drawer Header')));
    for (int i = 0; i < pages.length; i++) {
      drawerList.add(ListTile(
        title: Text('Page ${i + 1}'),
        onTap: () {
          onItemClick(i);
        },
      ));
    }
    return drawerList;
  }
}
