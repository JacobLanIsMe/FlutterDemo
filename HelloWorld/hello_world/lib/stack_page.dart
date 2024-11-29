import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            color: Colors.amber,
            child: const Text(
              '111',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Positioned(
              left: 10,
              child: Container(
            color: Colors.red,
            child: const Text(
              '222',
              style: TextStyle(fontSize: 20),
            ),
          ),)
        ],
      ),
    );
  }
}
