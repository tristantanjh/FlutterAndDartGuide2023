import 'package:flutter/material.dart';

class MealItemMetadata extends StatelessWidget {
  const MealItemMetadata(this.icon, this.label, {super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
