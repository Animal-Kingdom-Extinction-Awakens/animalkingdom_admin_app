// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:animalkingdom_admin_app/src/data/adapters/animal_adapter.dart';
import 'package:animalkingdom_admin_app/src/data/adapters/animal_detail_adapter.dart';
import 'package:animalkingdom_admin_app/src/data/adapters/rarity_adapter.dart';
import 'package:animalkingdom_admin_app/src/data/adapters/specie_adapter.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_detail.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/services/animal_service.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/const.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/messages.dart';
import 'package:dson_adapter/dson_adapter.dart';
import 'package:uno/uno.dart';

class AnimalServiceImpl implements AnimalService {
  final Uno uno;

  AnimalServiceImpl(this.uno);

  @override
  Future<List<Animal>> getAnimals() async {
    try {
      final response = await uno.get(
        '$host/animals',
      );
      final list = response.data['listAnimal'] as List;
      final animals = list.map(AnimalAdapter.fromMap).toList();
      return animals;
    } on UnoError catch (e, s) {
      final exception = AnimalServiceException(fetchAnimalsError, s);
      throw exception;
    } on DSONException catch (e, s) {
      final exception = AnimalServiceException(fetchAnimalsError, s);
      throw exception;
    }
  }

  @override
  Future<AnimalDetail> getAnimalById(String? id) async {
    try {
      final response = await uno.get(
        '$host/animals/$id',
      );
      final obj = response.data['animal'];
      final animals = AnimalDetailAdapter.fromMap(obj);
      return animals;
    } on UnoError catch (e, s) {
      final exception = AnimalServiceException(fetchAnimalByIdError, s);
      throw exception;
    } on DSONException catch (e, s) {
      final exception = AnimalServiceException(fetchAnimalByIdError, s);
      throw exception;
    }
  }

  @override
  Future<List<Rarity>> getRarities() async {
    try {
      final response = await uno.get(
        '$host/rarities',
      );
      final list = response.data['listRarity'] as List;
      final rarities = list.map(RarityAdapter.fromMap).toList();
      return rarities;
    } on UnoError catch (e, s) {
      final exception = AnimalServiceException(fetchRarityError, s);
      throw exception;
    } on DSONException catch (e, s) {
      final exception = AnimalServiceException(fetchRarityError, s);
      throw exception;
    }
  }

  @override
  Future<List<Specie>> getSpecies() async {
    try {
      final response = await uno.get(
        '$host/species',
      );
      final list = response.data['listSpecie'] as List;
      final species = list.map(SpecieAdapter.fromMap).toList();
      return species;
    } on UnoError catch (e, s) {
      final exception = AnimalServiceException(fetchSpecieError, s);
      throw exception;
    } on DSONException catch (e, s) {
      final exception = AnimalServiceException(fetchSpecieError, s);
      throw exception;
    }
  }

  @override
  Future createAnimal(AnimalForm animal) async {
    try {
      final arquivo = File(animal.image?.path ?? '');

      final form = FormData()
        ..add('name', animal.name)
        ..add('idSpecie', animal.idSpecie)
        ..add('idRarity', animal.idRarity)
        ..add('description', animal.description)
        ..addFile('fileImage', arquivo.path);

      await uno.post(
        '$host/animals',
        data: form,
      );
    } on UnoError catch (e) {
      switch (e.response?.status) {
        case 400:
          throw AnimalServiceException(e.response?.data['message']);
        default:
          throw const AnimalServiceException(createAnimalError);
      }
    }
  }

  @override
  Future deleteAnimal(String? id) async {
    try {
      await uno.delete('$host/animals/$id');
    } on UnoError catch (e) {
      switch (e.response?.status) {
        case 400:
          throw AnimalServiceException(e.response?.data['message']);
        default:
          throw const AnimalServiceException(createAnimalError);
      }
    }
  }

    @override
  Future updateAnimal(AnimalForm? animal) async {
    try {
      final arquivo = File(animal?.image?.path ?? '');

      final form = FormData()
        ..add('name', animal?.name)
        ..add('idSpecie', animal?.idSpecie)
        ..add('idRarity', animal?.idRarity)
        ..add('description', animal?.description)
        ..addFile('fileImage', arquivo.path);

      await uno.put(
        '$host/animals/${animal?.id}',
        data: form,
      );
    } on UnoError catch (e) {
      switch (e.response?.status) {
        case 400:
          throw AnimalServiceException(e.response?.data['message']);
        default:
          throw const AnimalServiceException(editAnimalError);
      }
    }
  }
}
