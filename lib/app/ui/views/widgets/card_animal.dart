import 'package:animalkingdom_admin_app/app/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/ui/views/widgets/text_rarity.dart';
import 'package:flutter/material.dart';

class CardAnimal extends StatelessWidget {
  final Animal animal;

  const CardAnimal({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            'https://i.seadn.io/gcs/files/3b572c319ce2e4e047ba16b5a2bdacba.png',
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      animal.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      animal.specie,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                TextRarity(rarity: animal.rarity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
