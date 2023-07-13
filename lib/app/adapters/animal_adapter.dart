import 'package:animalkingdom_admin_app/app/entities/animal.dart';

class AnimalAdapter {
  AnimalAdapter._();

  static Animal fromMap(dynamic map) {
    return Animal(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'],
      specie: map['specie'] ?? '',
      rarity: map['rarity'] ?? '',
    );
  }
}
