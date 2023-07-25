import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:dson_adapter/dson_adapter.dart';

class RarityAdapter {
  RarityAdapter._();

  static Rarity fromMap(dynamic map) {
    const dson = DSON();
    return dson.fromJson<Rarity>(
      map,
      Rarity.new,
    );
  }
}
