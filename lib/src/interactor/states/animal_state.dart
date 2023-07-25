import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';

sealed class AnimalState {
  final List<Animal> animals;
  final bool loading;
  final AnimalException? exception;

  const AnimalState({
    required this.animals,
    this.loading = false,
    this.exception,
  });

  factory AnimalState.start() {
    print('Iniciando estado de animais');
    return const StartAnimalState();
  }

  void setAnimals(List<Animal> animals) {
    print('Animais recebidos: ${animals.length}');
    animalState.setValue(GettedAnimalState(animals: animals));
  }

  void setLoading() {
    print('Carregando animais');
    animalState.setValue(LoadingAnimalState(animals: animals));
  }

  void setError(AnimalException exception) {
    print('Erro ao carregar animais: $exception');
    animalState.setValue(
      ErrorAnimalState(
        exception: exception,
        animals: animals,
      ),
    );
  }
}

class StartAnimalState extends AnimalState {
  const StartAnimalState() : super(animals: const []);
}

class GettedAnimalState extends AnimalState {
  const GettedAnimalState({required super.animals});
}

class LoadingAnimalState extends AnimalState {
  const LoadingAnimalState({required super.animals}) : super(loading: true);
}

class ErrorAnimalState extends AnimalState {
  const ErrorAnimalState({
    required super.exception,
    required super.animals,
  }) : super(loading: false);
}
