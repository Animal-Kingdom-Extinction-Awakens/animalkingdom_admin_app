import 'package:animalkingdom_admin_app/app/search/domain/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/entities/enums/rarity_animal_enum.dart';
import 'package:animalkingdom_admin_app/app/search/domain/entities/skill.dart';
import 'package:animalkingdom_admin_app/app/search/domain/entities/species_animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/errors/animal_failure.dart';
import 'package:animalkingdom_admin_app/app/search/domain/repositories/animal_repository.dart';
import 'package:animalkingdom_admin_app/app/search/domain/usecases/get_animals.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnimalRepositoryMock extends Mock implements AnimalRepository {}

void main() {
  final repository = AnimalRepositoryMock();
  final usecase = GetAnimalsImpl(repository);

  final skill = Skill(
    id: 'id',
    name: 'name',
    description: 'description',
  );
  final listSkills = <Skill>[skill];
  final species = SpeciesAnimal(
    id: 'id',
    name: 'name',
    description: 'description',
  );
  final animal = Animal(
    id: 'id',
    name: 'name',
    species: species,
    rarity: RarityAnimalEnum.commom,
    listSkills: listSkills,
  );

  test('get animals return empty list', () async {
    when(repository.getAnimals).thenAnswer((_) async => right(<Animal>[]));
    final result = await usecase();
    expect(result.fold(id, id), isA<EmptyList>());
  });

  test('get animals return result', () async {
    when(repository.getAnimals)
        .thenAnswer((_) async => right(<Animal>[animal]));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<Animal>>());
  });
}
