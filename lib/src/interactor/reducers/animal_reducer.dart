// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/atoms/animal_atom.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/services/animal_service.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class AnimalReducer extends Reducer {
  final AnimalService service;

  AnimalReducer(this.service) {
    on(() => [fetchAnimalsAction], _fetchAnimals);
    on(() => [fetchAnimalByIdAction], _fetchAnimalById);
    on(() => [fetchAnimalFormCreateAction], _fetchAnimalFormCreate);
    on(() => [createAnimalAction], _createAnimal);
    on(() => [deleteAnimalByIdAction], _deleteAnimalById);
    on(() => [fetchAnimalFormEditAction], _fetchAnimalFormEdit);
    on(() => [editAnimalAction], _editAnimal);
  }

  Future _fetchAnimals() async {
    try {
      animalState.value.setLoading();
      final animals = await service.getAnimals();
      animalState.value.setAnimals(animals);
    } catch (e) {
      animalState.value.setError(AnimalServiceException(e.toString()));
    }
  }

  Future _fetchAnimalById() async {
    try {
      final id = fetchAnimalByIdAction.value;
      animalDetailState.value.setLoading();
      final animalById = await service.getAnimalById(id);
      animalDetailState.value.setAnimals(animalById);
    } catch (e) {
      animalDetailState.value.setError(AnimalServiceException(e.toString()));
    }
  }

  Future _fetchAnimalFormCreate() async {
    try {
      animalFormCreateState.value.setLoading();
      final species = await service.getSpecies();
      final rarities = await service.getRarities();
      animalFormCreateState.value.setForm(
        species: species,
        rarities: rarities,
      );
    } catch (e) {
      animalFormCreateState.value.setError(AnimalServiceException(e.toString()));
    }
  }

  Future _createAnimal() async {
    try {
      animalFormCreateState.value.setLoading();
      final animal = animalFormCreateState.value.animal;
      await service.createAnimal(animal);
      Modular.to.navigate(routeAnimals);
    } catch (e) {
      animalFormCreateState.value
          .setError(AnimalServiceException(e.toString()));
    }
  }

  Future _deleteAnimalById() async {
    try {
      animalDetailState.value.setLoading();
      final id = deleteAnimalByIdAction.value;
      await service.deleteAnimal(id);
      animalDetailState.value.setDeleted();
    } catch (e) {
      animalDetailState.value.setError(AnimalServiceException(e.toString()));
    }
  }

  Future _fetchAnimalFormEdit() async {
    try {
      final id = fetchAnimalFormEditAction.value;
      animalFormEditState.value.setLoading();
      final animalDetail = await service.getAnimalById(id);
      final species = await service.getSpecies();
      final rarities = await service.getRarities();

      final animal = AnimalForm(
        id: animalDetail.id,
        name: animalDetail.name,
        description: animalDetail.description,
        idSpecie: animalDetail.specie.id,
        idRarity: animalDetail.rarity.id,
        image: XFile(''),
      );

      animalFormEditState.value.setForm(
        animal: animal,
        species: species,
        rarities: rarities,
      );
    } catch (e) {
      animalFormEditState.value.setError(AnimalServiceException(e.toString()));
    }
  }

  Future _editAnimal() async {
    try {
      animalFormEditState.value.setLoading();
      final animal = editAnimalAction.value;
      await service.updateAnimal(animal);
      animalFormEditState.value.setEdited();
    } catch (e) {
      animalFormEditState.value
          .setError(AnimalServiceException(e.toString()));
    }
  }
}
