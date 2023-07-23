import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQnIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currQnIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currQn = questions[currQnIndex];

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
            Text(currQn.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 237, 201, 245),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            ...currQn.shuffledAnswers.map((text) => AnswerButton(text, () {
                  answerQuestion(text);
                })),
          ],
        ),
      ),
    );
  }
}
