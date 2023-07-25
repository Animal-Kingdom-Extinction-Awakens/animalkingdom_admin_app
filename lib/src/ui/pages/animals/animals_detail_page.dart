// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_detail.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_detail_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/const.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/app_page_template.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/custom_loading.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/message_exception.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/text_rarity.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AnimalsDetailPage extends StatefulWidget {
  final String id;

  const AnimalsDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<AnimalsDetailPage> createState() => _AnimalsDetailPageState();
}

class _AnimalsDetailPageState extends State<AnimalsDetailPage>
    with AppPageTemplate {
  @override
  void initState() {
    super.initState();

    fetchAnimalByIdAction.setValue(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => animalDetailState.value);
    final mediaQuery = MediaQuery.of(context);

    final widthSizedBox = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: mediaQuery.size.width),
        Condition.equals(name: TABLET, value: mediaQuery.size.width * 0.6),
        Condition.largerThan(name: TABLET, value: mediaQuery.size.width * 0.5),
      ],
    ).value;

    final heightSizedBox = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.smallerThan(
          name: TABLET,
          value: mediaQuery.size.height * 0.9,
        ),
        Condition.equals(name: TABLET, value: mediaQuery.size.height * 0.9),
        Condition.largerThan(name: TABLET, value: mediaQuery.size.height * 0.9),
      ],
    ).value;

    return SizedBox(
      width: widthSizedBox,
      height: heightSizedBox,
      child: ListView(
        children: [
          switch (state) {
            StartAnimalDetailState() => _buildAnimalLoading(),
            GettedAnimalDetailState() =>
              _buildAnimalSuccess(state.animal, mediaQuery),
            ErrorAnimalDetailState() => _buildAnimalError(state.exception),
            LoadingAnimalDetailState() => _buildAnimalLoading(),
            DeletedAnimalDetailState() => _buildAnimalDeleted(),
          },
        ],
      ),
    );
  }

  Widget _buildAnimalSuccess(AnimalDetail animal, MediaQueryData mediaQuery) {
    final heightImage = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.smallerThan(
          name: TABLET,
          value: mediaQuery.size.height * 0.2,
        ),
        Condition.equals(name: TABLET, value: mediaQuery.size.height * 0.3),
        Condition.largerThan(name: TABLET, value: mediaQuery.size.height * 0.4),
      ],
    ).value;

    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Icon(Icons.delete),
                  onPressed: () => _deleteAnimal(animal.id.toString()),
                ),
                ElevatedButton(
                  child: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '$host/animals/${animal.id}/image?time=${DateTime.now().millisecondsSinceEpoch}',
                    height: heightImage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      TextRarity(rarity: animal.rarity),
                      const SizedBox(width: 8),
                      Text(
                        animal.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(animal.description),
                      const SizedBox(height: 16),
                      Text(
                        animal.specie.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        width: 400,
                        child: Text(
                          animal.specie.description ?? 'Sem descricao',
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        child: const Text('Editar'),
                        onPressed: () {
                          Modular.to.navigate('${routeAnimals}edit/${animal.id}');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomLoading _buildAnimalLoading() {
    return const CustomLoading();
  }

  MessageException _buildAnimalError(AnimalException? exception) {
    return MessageException(
      exception: exception,
      action: _fetchAnimalByIdAction,
      route: routeAnimals,
    );
  }

  void _fetchAnimalByIdAction() {
    fetchAnimalByIdAction.setValue(widget.id);
  }

  void _deleteAnimal(String id) {
    deleteAnimalByIdAction.setValue(id);
  }

  Widget _buildAnimalDeleted() {
    return AlertDialog(
      icon: const Icon(Icons.check),
      title: const Text('Animal deletado'),
      content: const Text('O animal foi deletado com sucesso'),
      actions: [
        TextButton(
          onPressed: () {
            fetchAnimalsAction();
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
