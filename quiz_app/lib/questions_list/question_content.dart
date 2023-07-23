import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (itemData['question'] as String),
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            (itemData['user_answer'] as String),
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 201, 245)),
          ),
          const SizedBox(height: 5),
          Text(
            (itemData['correct_answer'] as String),
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 135, 241, 210)),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
