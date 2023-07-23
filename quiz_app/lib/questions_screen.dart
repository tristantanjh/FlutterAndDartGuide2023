import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // alternative to using Center widget and mainAxisSize
      width: double.infinity, // takes up width of whole screen
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // aligns column to vertical center
        children: [
          const Text(
            'Question: ',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          AnswerButton('Answer 1', () {}),
          AnswerButton('Answer 2', () {}),
          AnswerButton('Answer 3', () {}),
          AnswerButton('Answer 4', () {}),
        ],
      ),
    );
  }
}
