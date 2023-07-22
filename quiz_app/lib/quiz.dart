import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  // allows for initialization and thus passing functions to child widgets
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  } // executes when object is initialized (happens only once)

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    }); // lets you render new content by 'refreshing' the widget
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          Scaffold(body: Container(color: Colors.purple, child: activeScreen)),
    );
  }
}
