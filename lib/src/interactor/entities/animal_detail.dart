// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';

class AnimalDetail {
  final int id;
  final String name;
  final String description;
  final Specie specie;
  final Rarity rarity;

  const AnimalDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.specie,
    required this.rarity,
  });

  factory AnimalDetail.empty() {
    return AnimalDetail(
      id: 0,
      name: '',
      description: '',
      specie: Specie.empty(),
      rarity: Rarity.empty(),
    );
  }
}
