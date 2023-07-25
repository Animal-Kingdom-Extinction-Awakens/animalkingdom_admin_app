import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_detail.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';

abstract interface class AnimalService {
  Future<List<Animal>> getAnimals();
  Future<AnimalDetail> getAnimalById(String? id);

  Future<List<Specie>> getSpecies();
  Future<List<Rarity>> getRarities();

  Future createAnimal(AnimalForm animal);
  Future deleteAnimal(String? id);
  Future updateAnimal(AnimalForm? animal);
}
