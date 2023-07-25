// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_form_create_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/animal_custom_form.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/app_page_template.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/custom_loading.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/message_exception.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

class AnimalsCreatePage extends StatefulWidget {
  const AnimalsCreatePage({super.key});

  @override
  State<AnimalsCreatePage> createState() => _AnimalsCreatePageState();
}

class _AnimalsCreatePageState extends State<AnimalsCreatePage>
    with AppPageTemplate {
  @override
  void initState() {
    super.initState();

    _action();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final state = context.select(() => animalFormCreateState.value);

    return template(
      page: switch (state) {
        StartAnimalFormCreateState() => _buildAnimalLoading(),
        GettedAnimalFormCreateState() => _buildAnimalSuccess(
            state.animal,
            _formKey,
            state.species,
            state.rarities,
          ),
        LoadingAnimalFormCreateState() => _buildAnimalLoading(),
        ErrorAnimalFormCreateState() => _buildAnimalError(state.exception),
      },
      index: 1,
    );
  }

  CustomLoading _buildAnimalLoading() {
    return const CustomLoading();
  }

  Widget _buildAnimalSuccess(
    AnimalForm animal,
    GlobalKey<FormState> _formKey,
    List<Specie> species,
    List<Rarity> rarities,

  ) {
    return AnimalCustomForm(
      animal: animal,
      rarities: rarities,
      species: species,
      action: createAnimalAction,
      formKey: _formKey,
      isEdit: false,
    );
  }

  Widget _buildAnimalError(AnimalException? exception) {
    return MessageException(
      action: _action,
      exception: exception,
      route: routeAnimals,
    );
  }

  void _action() {
    fetchAnimalFormCreateAction();
  }
}
