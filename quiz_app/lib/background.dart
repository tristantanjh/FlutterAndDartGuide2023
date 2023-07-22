import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(155, 255, 255, 255),
          ),

          // Try not to use as it is performance intensive
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const Padding(
              padding: EdgeInsets.all(40),
              child: Text('Learn Flutter the Fun way!',
                  style: TextStyle(color: Colors.white, fontSize: 28))),
          OutlinedButton.icon(
              onPressed: onPressed,
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
