import 'package:animalkingdom_admin_app/app/adapters/animal_adapter.dart';
import 'package:animalkingdom_admin_app/app/entities/animal.dart';
import 'package:uno/uno.dart';

mixin AnimalRepository {
  Future<List<Animal>> call();
}

class AnimalRepositoryImpl implements AnimalRepository {
  final Uno uno;

  AnimalRepositoryImpl(this.uno);

  @override
  Future<List<Animal>> call() async {
    const url = 'http://localhost:8080/animals';
    final response = await uno.get(url).then((value) {
      final list = <Animal>[];
      for (final item in value.data['listAnimal']) {
        list.add(AnimalAdapter.fromMap(item));
      }
      return list;
    }).catchError((error) {
      print(error);
      throw Exception();
    });
    return response;
  }
}
