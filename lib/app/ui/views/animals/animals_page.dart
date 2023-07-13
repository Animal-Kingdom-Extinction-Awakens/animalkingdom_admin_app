// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/app/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/app/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/states/animal_state.dart';
import 'package:animalkingdom_admin_app/app/ui/views/widgets/app_page_template.dart';
import 'package:animalkingdom_admin_app/app/ui/views/widgets/list_animals.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> with AppPageTemplate {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchAnimals.value = Object();
    });
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [animalState.value]);

    return template(
      page: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Text(
              'Animais',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            switch (animalState.value) {
              AnimalStart() => const CircularProgressIndicator(),
              AnimalSuccess(lsAnimal: final lsAnimal) =>
                _buildAnimalSuccess(lsAnimal),
              AnimalLoading() => const CircularProgressIndicator(),
              AnimalFailed(message: final message) => Text(message)
            },
          ],
        ),
      ),
      index: 1,
    );
  }

  Widget _buildAnimalSuccess(List<Animal> lsAnimal) {
    return ListAnimals(lsAnimal: lsAnimal);
  }
}
