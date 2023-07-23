import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class ScreenManager extends StatefulWidget {
  const ScreenManager({super.key});

  @override
  State<ScreenManager> createState() {
    return _ScreenManagerState();
  }
}

class _ScreenManagerState extends State<ScreenManager> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  // allows for initialization and thus passing functions to child widgets
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  } // executes when object is initialized (happens only once)

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(setAnswer);
    }); // lets you render new content by 'refreshing' the widget
  }

  void setAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = StartScreen(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          Scaffold(body: Container(color: Colors.purple, child: activeScreen)),
    );
  }
}
