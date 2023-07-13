import 'package:animalkingdom_admin_app/app/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/ui/views/widgets/card_animal.dart';
import 'package:flutter/material.dart';

class ListAnimals extends StatelessWidget {
  final List<Animal> lsAnimal;

  const ListAnimals({
    super.key,
    required this.lsAnimal,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.85,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: _getLsCardAnimal(),
      ),
    );
  }

  List<CardAnimal> _getLsCardAnimal() {
    return lsAnimal
        .map(
          (animal) => CardAnimal(animal: animal),
        )
        .toList();
  }
}
