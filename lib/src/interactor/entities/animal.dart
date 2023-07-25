// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';

class Animal {
  final int id;
  final String name;
  final String specie;
  final Rarity rarity;
  
  Animal({
    required this.id,
    required this.name,
    required this.specie,
    required this.rarity,
  });

  @override
  String toString() {
    return 'Animal(id: $id, name: $name, specie: $specie, rarity: $rarity)';
  }
}
