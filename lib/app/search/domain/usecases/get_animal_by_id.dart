// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animalkingdom_admin_app/app/search/domain/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/errors/animal_failure.dart';
import 'package:animalkingdom_admin_app/app/search/domain/repositories/animal_repository.dart';
import 'package:dartz/dartz.dart';

mixin GetAnimalById {
  Future<Either<AnimalFailure, Animal>> call(String id);
}

class GetAnimalByIdImpl implements GetAnimalById {
  final AnimalRepository repository;

  GetAnimalByIdImpl(this.repository);

  @override
  Future<Either<AnimalFailure, Animal>> call(String id) async {
    final result = await repository.getAnimal(id);
    return result.fold(left, right);
  }
}
