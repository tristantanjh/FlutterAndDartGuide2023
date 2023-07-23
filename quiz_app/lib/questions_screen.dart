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
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // aligns column to vertical center
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQn.question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 30),
            ...currQn
                .shuffledAnswers()
                .map((text) => AnswerButton(text, () {})),
          ],
        ),
      ),
    );
  }
}
