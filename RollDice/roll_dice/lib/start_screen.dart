import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/asset/image/quiz-logo.png',
          width: 300
        ),
        const SizedBox(height: 50),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)))),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'start Quiz',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
