import 'package:animalkingdom_admin_app/app/search/domain/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/errors/animal_failure.dart';
import 'package:animalkingdom_admin_app/app/search/domain/repositories/animal_repository.dart';
import 'package:animalkingdom_admin_app/app/search/infra/datasources/animal_datasource.dart';
import 'package:dartz/dartz.dart';

class AnimalRepositoryImpl implements AnimalRepository {
  final AnimalDatasource datasource;

  AnimalRepositoryImpl(this.datasource);

  @override
  Future<Either<AnimalFailure, List<Animal>>> getAnimals() async {
    try {
      final result = await datasource.getAnimals();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError(message: e.toString()));
    }
  }

  @override
  Future<Either<AnimalFailure, void>> createAnimal(Animal animal) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AnimalFailure, void>> deleteAnimal(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AnimalFailure, Animal>> getAnimal(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AnimalFailure, void>> updateAnimal(Animal animal) {
    throw UnimplementedError();
  }
}
