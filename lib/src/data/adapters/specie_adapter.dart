import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:dson_adapter/dson_adapter.dart';

class SpecieAdapter {
  SpecieAdapter._();

  static Specie fromMap(dynamic map) {
    const dson = DSON();
    return dson.fromJson<Specie>(
      map,
      Specie.new,
    );
  }
}
