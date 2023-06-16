import 'package:animalkingdom_admin_app/app/search/domain/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/errors/animal_failure.dart';
import 'package:animalkingdom_admin_app/app/search/domain/repositories/animal_repository.dart';
import 'package:dartz/dartz.dart';

mixin GetAnimals {
  Future<Either<AnimalFailure, List<Animal>>> call();
}

class GetAnimalsImpl implements GetAnimals {
  final AnimalRepository repository;

  GetAnimalsImpl(this.repository);

  @override
  Future<Either<AnimalFailure, List<Animal>>> call() async {
    final result = await repository.getAnimals();
    return result.fold(left, (r) => r.isEmpty ? left(EmptyList()) : right(r));
  }
}
