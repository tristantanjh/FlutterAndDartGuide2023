import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQns = questions.length;
    final numCorrectQns = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    'You answered $numCorrectQns out of $numTotalQns questions correctly!'),
                const SizedBox(height: 30),
                QuestionsSummary(summaryData),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {}, child: const Text('Restart Quiz!')),
              ],
            )));
  }
}
