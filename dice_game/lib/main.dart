import 'package:flutter/material.dart';
import 'package:dice_game/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 136, 106, 187),
          Color.fromARGB(255, 211, 211, 211)
        ]),
      ),
    ),
  );
}
