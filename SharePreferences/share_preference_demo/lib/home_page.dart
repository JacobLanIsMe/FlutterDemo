import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    getCount();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = prefs.getInt('count') ?? 0;
    });
  }

  void setCount() async {
    setState(() {
      count++;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Text('Count: $count'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: setCount
      ),
    );
  }
}
