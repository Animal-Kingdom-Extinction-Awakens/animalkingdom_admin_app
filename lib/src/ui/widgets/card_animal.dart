import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/const.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/animals/animals_detail_page.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/text_rarity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardAnimal extends StatefulWidget {
  final Animal animal;

  const CardAnimal({
    super.key,
    required this.animal,
  });

  @override
  State<CardAnimal> createState() => _CardAnimalState();
}

class _CardAnimalState extends State<CardAnimal> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalAnimalDetail(context),
      child: Card(
        child: Column(
          children: [
            Image.network(
              '$host/animals/${widget.animal.id}/image?time=${DateTime.now().millisecondsSinceEpoch}',
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.animal.specie,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.animal.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextRarity(rarity: widget.animal.rarity),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _showModalAnimalDetail(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return AnimalsDetailPage(
          id: widget.animal.id.toString(),
        );
      },
    );
  }
}
