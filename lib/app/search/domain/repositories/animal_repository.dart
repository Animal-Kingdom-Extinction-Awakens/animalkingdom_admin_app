import 'package:animalkingdom_admin_app/app/search/domain/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/errors/animal_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimalRepository {
  Future<Either<AnimalFailure, List<Animal>>> getAnimals();
  Future<Either<AnimalFailure, Animal>> getAnimal(int id);
  Future<Either<AnimalFailure, void>> createAnimal(Animal animal);
  Future<Either<AnimalFailure, void>> updateAnimal(Animal animal);
  Future<Either<AnimalFailure, void>> deleteAnimal(int id);
}
