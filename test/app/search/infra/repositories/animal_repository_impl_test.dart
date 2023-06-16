import 'package:animalkingdom_admin_app/app/search/domain/entities/enums/rarity_animal_enum.dart';
import 'package:animalkingdom_admin_app/app/search/domain/errors/animal_failure.dart';
import 'package:animalkingdom_admin_app/app/search/infra/datasources/animal_datasource.dart';
import 'package:animalkingdom_admin_app/app/search/infra/models/animal_model.dart';
import 'package:animalkingdom_admin_app/app/search/infra/models/skill_model.dart';
import 'package:animalkingdom_admin_app/app/search/infra/models/species_animal_model.dart';
import 'package:animalkingdom_admin_app/app/search/infra/repositories/animal_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnimalDatasourceMock extends Mock implements AnimalDatasource {}

void main() {

  final datasource = AnimalDatasourceMock();
  final repository = AnimalRepositoryImpl(datasource);

   final skill = SkillModel(
    id: 'id',
    name: 'name',
    description: 'description',
  );
  final listSkills = <SkillModel>[skill];
  final species = SpeciesAnimalModel(
    id: 'id',
    name: 'name',
    description: 'description',
  );
  final animal = AnimalModel(
    id: 'id',
    name: 'name',
    species: species,
    rarity: RarityAnimalEnum.commom,
    listSkills: listSkills,
  );

  test('get animals return ListAnimals', () async {
    when(datasource.getAnimals)
        .thenAnswer((_) async => <AnimalModel>[animal]);
    final result = await repository.getAnimals();
    expect(result.fold(id, id), isA<List<AnimalModel>>());
  });

    test('get animals return DatasourceError', () async {
    when(datasource.getAnimals).thenThrow(Exception());
    final result = await repository.getAnimals();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
