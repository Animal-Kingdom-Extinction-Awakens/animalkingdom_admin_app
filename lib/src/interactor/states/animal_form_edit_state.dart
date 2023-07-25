import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';

sealed class AnimalFormEditState {
  final AnimalForm animal;
  final List<Specie> species;
  final List<Rarity> rarities;
  final bool loading;
  final AnimalException? exception;

  const AnimalFormEditState({
    required this.animal,
    required this.species,
    required this.rarities,
    this.loading = false,
    this.exception,
  });

  factory AnimalFormEditState.start() {
    print('Iniciando estado do formulario animal');
    return StartAnimalFormEditState();
  }

  void setForm({
    required AnimalForm animal,
    required List<Specie> species,
    required List<Rarity> rarities,
  }) {
    print('Itens do formulario animal carregados');
    animalFormEditState.setValue(
      GettedAnimalFormEditState(
        animal: animal,
        species: species,
        rarities: rarities,
      ),
    );
  }

  void setLoading() {
    print('Carregando formulario animal');
    animalFormEditState.setValue(
      LoadingAnimalFormEditState(
        animal: animal,
        species: species,
        rarities: rarities,
      ),
    );
  }

  void setError(AnimalException exception) {
    print('Erro ao carregar animal formulario: $exception');
    animalFormEditState.setValue(
      ErrorAnimalFormEditState(
        exception: exception,
        animal: animal,
        species: species,
        rarities: rarities,
      ),
    );
  }

  void setEdited() {
    print('Animal editado');
    animalFormEditState.setValue(EditedAnimalFormEditState(
      animal: animal,
      species: species,
      rarities: rarities,
    ),);
  }
}

class StartAnimalFormEditState extends AnimalFormEditState {
  StartAnimalFormEditState()
      : super(
          animal: AnimalForm(),
          species: const [],
          rarities: const [],
        );
}

class GettedAnimalFormEditState extends AnimalFormEditState {
  const GettedAnimalFormEditState({
    required super.animal,
    required super.species,
    required super.rarities,
  });
}

class LoadingAnimalFormEditState extends AnimalFormEditState {
  const LoadingAnimalFormEditState({
    required super.animal,
    required super.species,
    required super.rarities,
  }) : super(loading: true);
}

class ErrorAnimalFormEditState extends AnimalFormEditState {
  const ErrorAnimalFormEditState({
    required super.exception,
    required super.animal,
    required super.species,
    required super.rarities,
  }) : super(loading: false);
}

class EditedAnimalFormEditState extends AnimalFormEditState {
  const EditedAnimalFormEditState({
    required super.animal,
    required super.species,
    required super.rarities,
  });
}
