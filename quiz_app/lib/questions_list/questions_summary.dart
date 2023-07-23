import 'package:flutter/material.dart';
import 'package:quiz_app/questions_list/question_number.dart';
import 'package:quiz_app/questions_list/question_content.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData
                .map(
                  (data) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QuestionNumber(data['question_index'] as int,
                            data['correct_answer'] == data['user_answer']),
                        const SizedBox(
                          width: 15,
                        ),
                        QuestionContent(data),
                      ],
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
