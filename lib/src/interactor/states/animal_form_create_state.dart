import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';

sealed class AnimalFormCreateState {
  final AnimalForm animal;
  final List<Specie> species;
  final List<Rarity> rarities;
  final bool loading;
  final AnimalException? exception;

  const AnimalFormCreateState({
    required this.animal,
    required this.species,
    required this.rarities,
    this.loading = false,
    this.exception,
  });

  factory AnimalFormCreateState.start() {
    print('Iniciando estado do formulario animal');
    return StartAnimalFormCreateState();
  }

  void setForm({
    required List<Specie> species,
    required List<Rarity> rarities,
  }) {
    print('Itens do formulario animal carregados');
    animalFormCreateState.setValue(
      GettedAnimalFormCreateState(
        animal: AnimalForm(
          idRarity: rarities.first.id,
          idSpecie: species.first.id,
        ),
        species: species,
        rarities: rarities,
      ),
    );
  }

  void setLoading() {
    print('Carregando formulario animal');
    animalFormCreateState.setValue(
      LoadingAnimalFormCreateState(
        animal: animal,
        species: species,
        rarities: rarities,
      ),
    );
  }

  void setError(AnimalException exception) {
    print('Erro ao carregar animal formulario: $exception');
    animalFormCreateState.setValue(
      ErrorAnimalFormCreateState(
        exception: exception,
        animal: animal,
        species: species,
        rarities: rarities,
      ),
    );
  }
}

class StartAnimalFormCreateState extends AnimalFormCreateState {
  StartAnimalFormCreateState()
      : super(
          animal: AnimalForm(),
          species: const [],
          rarities: const [],
        );
}

class GettedAnimalFormCreateState extends AnimalFormCreateState {
  const GettedAnimalFormCreateState({
    required super.animal,
    required super.species,
    required super.rarities,
  });
}

class LoadingAnimalFormCreateState extends AnimalFormCreateState {
  const LoadingAnimalFormCreateState({
    required super.animal,
    required super.species,
    required super.rarities,
  }) : super(loading: true);
}

class ErrorAnimalFormCreateState extends AnimalFormCreateState {
  const ErrorAnimalFormCreateState({
    required super.exception,
    required super.animal,
    required super.species,
    required super.rarities,
  }) : super(loading: false);
}
