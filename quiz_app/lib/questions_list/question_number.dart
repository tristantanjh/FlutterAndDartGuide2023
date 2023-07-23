import 'package:flutter/material.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber(this.qnNum, this.isCorrect, {super.key});

  final int qnNum;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrect
              ? const Color.fromARGB(255, 135, 241, 210)
              : const Color.fromARGB(255, 241, 79, 93),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          (qnNum + 1).toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }
}
