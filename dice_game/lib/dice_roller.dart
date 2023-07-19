import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currDiceNum = 2;

  void rollDice() {
    setState(() {
      currDiceNum = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/dice-$currDiceNum.png',
        width: 200,
      ),
      // const SizedBox(height: 20), // Add Box of size 20 to simulate padding
      TextButton(
        onPressed: rollDice,
        style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 20,
            ), // Add Padding
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28)),
        child: const Text('Roll Dice'),
      )
    ]);
  }
}
