import 'package:flutter/material.dart';
import 'package:dice_game/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorsList, {super.key});

  final List<Color> colorsList;

  void rollDice() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorsList,
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(
              'assets/images/dice-1.png',
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
          ]),
        ));
  }
}
