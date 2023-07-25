import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_detail.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';

sealed class AnimalDetailState {
  final AnimalDetail animal;
  final bool loading;
  final AnimalException? exception;

  const AnimalDetailState({
    this.loading = false,
    required this.animal,
    this.exception,
  });

  factory AnimalDetailState.start() {
    print('Iniciando estado do detalhe animal');
    return StartAnimalDetailState();
  }

  void setAnimals(AnimalDetail animal) {
    print('Animais recebidos: ${animal.name}');
    animalDetailState.setValue(GettedAnimalDetailState(animal: animal));
  }

  void setLoading() {
    print('Carregando animais');
    animalDetailState.setValue(LoadingAnimalDetailState(animal: animal));
  }

  void setError(AnimalException exception) {
    print('Erro ao carregar animal: $exception');
    animalDetailState.setValue(
      ErrorAnimalDetailState(
        exception: exception,
        animal: animal,
      ),
    );
  }

  void setDeleted() {
    print('Animal deletado');
    animalDetailState.setValue(DeletedAnimalDetailState(animal: animal));
  }
}

class StartAnimalDetailState extends AnimalDetailState {
  StartAnimalDetailState() : super(animal: AnimalDetail.empty());
}

class GettedAnimalDetailState extends AnimalDetailState {
  const GettedAnimalDetailState({required super.animal});
}

class LoadingAnimalDetailState extends AnimalDetailState {
  const LoadingAnimalDetailState({required super.animal})
      : super(loading: true);
}

class ErrorAnimalDetailState extends AnimalDetailState {
  const ErrorAnimalDetailState({
    required super.exception,
    required super.animal,
  }) : super(loading: false);
}

class DeletedAnimalDetailState extends AnimalDetailState {
  const DeletedAnimalDetailState({required super.animal});
}
