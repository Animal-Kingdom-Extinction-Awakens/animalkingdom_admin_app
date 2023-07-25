import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_form_edit_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/animal_custom_form.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/app_page_template.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/custom_loading.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/message_exception.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimalsEditPage extends StatefulWidget {
  final String id;

  const AnimalsEditPage({super.key, required this.id});

  @override
  State<AnimalsEditPage> createState() => _AnimalsEditPageState();
}

class _AnimalsEditPageState extends State<AnimalsEditPage>
    with AppPageTemplate {
  @override
  void initState() {
    super.initState();

    _action(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final state = context.select(() => animalFormEditState.value);

    return template(
      page: switch (state) {
        StartAnimalFormEditState() => _buildAnimalLoading(),
        GettedAnimalFormEditState() => _buildAnimalSuccess(
            state.animal,
            _formKey,
            state.species,
            state.rarities,
          ),
        LoadingAnimalFormEditState() => _buildAnimalLoading(),
        ErrorAnimalFormEditState() => _buildAnimalError(
            state.exception,
            widget.id,
          ),
        EditedAnimalFormEditState() => _buildEditedAnimal(context),
      },
      index: 1,
    );
  }

  CustomLoading _buildAnimalLoading() {
    return const CustomLoading();
  }

  MessageException _buildAnimalError(AnimalException? exception, String id) {
    return MessageException(
      action: () => _action(id),
      exception: exception,
      route: routeAnimals,
    );
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
      action: editAnimalAction,
      formKey: _formKey,
      isEdit: true,
    );
  }

  void _action(String id) {
    fetchAnimalFormEditAction.setValue(id);
  }

  AlertDialog _buildEditedAnimal(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.check),
      title: const Text('Animal editado'),
      content: const Text('O animal foi editado com sucesso'),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pushNamedAndRemoveUntil(
              routeAnimals,
              (route) => route.isFirst,
            );
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
