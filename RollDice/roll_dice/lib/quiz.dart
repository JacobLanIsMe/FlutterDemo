import 'package:flutter/material.dart';
import 'package:roll_dice/data/questions.dart';
import 'package:roll_dice/questions_screen.dart';
import 'package:roll_dice/results_screen.dart';
import 'package:roll_dice/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void clearChosenAnswers(){
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'start-screen'){
      screenWidget = StartScreen(switchScreen);
    }
    else if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(chooseAnswer);
    }
    else{
      screenWidget = ResultsScreen(selectedAnswers, clearChosenAnswers);
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purple, Colors.transparent])),
              child: Center(child: screenWidget))),
    );
  }
}
