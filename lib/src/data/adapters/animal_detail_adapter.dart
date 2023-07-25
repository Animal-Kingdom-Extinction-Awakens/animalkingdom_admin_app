import 'package:animalkingdom_admin_app/src/interactor/entities/animal_detail.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:dson_adapter/dson_adapter.dart';

class AnimalDetailAdapter {
  AnimalDetailAdapter._();

  static AnimalDetail fromMap(dynamic map) {
    const dson = DSON();
    return dson.fromJson<AnimalDetail>(
      map,
      AnimalDetail.new,
      inner: {'rarity': Rarity.new, 'specie': Specie.new},
    );
  }
}
