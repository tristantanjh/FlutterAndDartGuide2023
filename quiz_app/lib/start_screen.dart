import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(155, 255, 255, 255),
          ),
          // Try not to use as it is performance intensive
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Padding(
              padding: const EdgeInsets.all(40),
              child: Text('Learn Flutter the Fun way!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 237, 201, 245),
                    fontSize: 28,
                  ))),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right),
              label: const Text('Start Quiz')),
        ],
      ),
    );
  }
}
