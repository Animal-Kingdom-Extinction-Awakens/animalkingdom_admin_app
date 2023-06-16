// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:animalkingdom_admin_app/app/search/domain/entities/animal.dart';
import 'package:animalkingdom_admin_app/app/search/domain/entities/enums/rarity_animal_enum.dart';
import 'package:animalkingdom_admin_app/app/search/infra/models/skill_model.dart';
import 'package:animalkingdom_admin_app/app/search/infra/models/species_animal_model.dart';
import 'package:flutter/foundation.dart';

class AnimalModel extends Animal {
  @override
  final String id;
  @override
  final String name;
  @override
  final SpeciesAnimalModel species;
  @override
  final RarityAnimalEnum rarity;
  @override
  final List<SkillModel> listSkills;

  AnimalModel({
    required this.id,
    required this.name,
    required this.species,
    required this.rarity,
    required this.listSkills,
  }) : super(
          id: id,
          name: name,
          species: species,
          rarity: rarity,
          listSkills: listSkills,
        );

  AnimalModel copyWith({
    String? id,
    String? name,
    SpeciesAnimalModel? species,
    RarityAnimalEnum? rarity,
    List<SkillModel>? listSkills,
  }) {
    return AnimalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      rarity: rarity ?? this.rarity,
      listSkills: listSkills ?? this.listSkills,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'species': species.toMap(),
      'rarity': rarity.name,
      'listSkills': listSkills.map((x) => x.toMap()).toList(),
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      id: map['id'] as String,
      name: map['name'] as String,
      species:
          SpeciesAnimalModel.fromMap(map['species'] as Map<String, dynamic>),
      rarity: map['rarity'] as RarityAnimalEnum,
      listSkills: List<SkillModel>.from(
        (map['listSkills'] as List<int>).map<SkillModel>(
          (x) => SkillModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimalModel(id: $id, name: $name, species: $species, rarity: $rarity, listSkills: $listSkills)';
  }

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.species == species &&
        other.rarity == rarity &&
        listEquals(other.listSkills, listSkills);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        species.hashCode ^
        rarity.hashCode ^
        listSkills.hashCode;
  }
}
