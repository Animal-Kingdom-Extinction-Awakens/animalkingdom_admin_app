// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:animalkingdom_admin_app/app/search/domain/entities/enums/rarity_animal_enum.dart';
import 'package:animalkingdom_admin_app/app/search/domain/entities/skill.dart';
import 'package:animalkingdom_admin_app/app/search/domain/entities/species_animal.dart';

class Animal {
  final String id;
  final String name;
  final SpeciesAnimal species;
  final RarityAnimalEnum rarity;
  final List<Skill> listSkills;

  Animal({
    required this.id,
    required this.name,
    required this.species,
    required this.rarity,
    required this.listSkills,
  });
}
