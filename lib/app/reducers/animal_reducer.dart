import 'package:animalkingdom_admin_app/app/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/app/states/animal_state.dart';
import 'package:animalkingdom_admin_app/app/usecases/get_animals.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AnimalReducer extends RxReducer {
  final GetAnimals usercase;

  AnimalReducer(this.usercase) {
    on(() => [fetchAnimals.value], _fetchAnimals);
  }

  Future<void> _fetchAnimals() async {
    try {
      animalState.value = AnimalLoading();
      final result = await usercase();
      animalState.value = AnimalSuccess(result);
    } catch (e) {
      animalState.value = const AnimalFailed('Erro ao buscar animais');
    }
  }
}
