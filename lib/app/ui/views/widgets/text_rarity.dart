import 'package:flutter/material.dart';

class TextRarity extends StatelessWidget {
  final String rarity;

  const TextRarity({
    super.key,
    required this.rarity,
  });

  @override
  Widget build(BuildContext context) {
    switch (rarity.toLowerCase()) {
      case 'common':
        return Text(
          rarity,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'uncommon':
        return Text(
          rarity,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'rare':
        return Text(
          rarity,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'epic':
        return Text(
          rarity,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'legendary':
        return Text(
          rarity,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        return const Text('Raridade não encontrada');
    }
  }
}
