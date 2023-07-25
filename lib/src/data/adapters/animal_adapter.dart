import 'package:animalkingdom_admin_app/src/interactor/entities/animal.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:dson_adapter/dson_adapter.dart';

class AnimalAdapter {
  AnimalAdapter._();

  static Animal fromMap(dynamic map) {
    const dson = DSON();
    return dson.fromJson<Animal>(
      map,
      Animal.new,
      inner: {'rarity': Rarity.new},
    );
  }
}
