import 'package:animalkingdom_admin_app/app/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/repositories/animal_repository.dart';

mixin GetAnimals {
  Future<List<Animal>> call();
}

class GetAnimalsImpl implements GetAnimals {
  final AnimalRepository repository;

  GetAnimalsImpl(this.repository);

  @override
  Future<List<Animal>> call() async {
    final result = await repository();
    return result;
  }
}
