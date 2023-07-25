import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/card_animal.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_value.dart';

class ListAnimals extends StatelessWidget {
  final List<Animal> lsAnimal;

  const ListAnimals({
    super.key,
    required this.lsAnimal,
  });

  @override
  Widget build(BuildContext context) {
    final childAspectRatio = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: 0.8),
        Condition.largerThan(name: TABLET, value: 0.85),
      ],
    ).value;

    return Flexible(
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 550,
          childAspectRatio: childAspectRatio ?? 0.80,
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
