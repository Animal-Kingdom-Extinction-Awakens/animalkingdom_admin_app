// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/messages.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/app_page_template.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/custom_loading.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/list_animals.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/message_exception.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> with AppPageTemplate {
  @override
  void initState() {
    super.initState();

    fetchAnimalsAction();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => animalState.value);

    return template(
      page: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Modular.to.navigate('${routeAnimals}create'),
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            children: [
              Text(
                titleAnimals,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              switch (state) {
                StartAnimalState() => _buildAnimalLoading(),
                GettedAnimalState() => _buildAnimalSuccess(state.animals),
                ErrorAnimalState() => _buildAnimalError(state.exception),
                LoadingAnimalState() => _buildAnimalLoading(),
              },
            ],
          ),
        ),
      ),
      index: 1,
    );
  }

  Widget _buildAnimalSuccess(List<Animal> lsAnimal) {
    return ListAnimals(lsAnimal: lsAnimal);
  }

  Widget _buildAnimalError(AnimalException? exception) {
    return MessageException(
      exception: exception,
      action: _fetchAnimalsAction,
    );
  }

  Widget _buildAnimalLoading() {
    return const CustomLoading();
  }

  void _fetchAnimalsAction() {
    fetchAnimalsAction();
  }
}
