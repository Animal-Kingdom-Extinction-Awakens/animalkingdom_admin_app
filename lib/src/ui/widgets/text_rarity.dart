import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:flutter/material.dart';

class TextRarity extends StatelessWidget {
  final Rarity rarity;

  const TextRarity({
    super.key,
    required this.rarity,
  });

  @override
  Widget build(BuildContext context) {
    switch (rarity.id) {
      case 1:
        return Text(
          rarity.name,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        );
      case 2:
        return Text(
          rarity.name,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        );
      case 3:
        return Text(
          rarity.name,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        );
      case 4:
        return Text(
          rarity.name,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        );
      case 5:
        return Text(
          rarity.name,
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
