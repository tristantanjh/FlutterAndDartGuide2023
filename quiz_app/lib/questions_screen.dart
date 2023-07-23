import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

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
    var currQn = questions[0];

    return SizedBox(
      // alternative to using Center widget and mainAxisSize
      width: double.infinity, // takes up width of whole screen
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // aligns column to vertical center
        children: [
          Text(
            currQn.question,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 30),
          ...currQn.answers.map((text) {
            return AnswerButton(text, () {});
          }),
        ],
      ),
    );
  }
}
