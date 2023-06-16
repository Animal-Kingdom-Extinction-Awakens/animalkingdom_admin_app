// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:animalkingdom_admin_app/app/search/domain/entities/species_animal.dart';

class SpeciesAnimalModel extends SpeciesAnimal {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  SpeciesAnimalModel({
    required this.id,
    required this.name,
    required this.description,
  }) : super(id: id, name: name, description: description);

  SpeciesAnimalModel copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return SpeciesAnimalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory SpeciesAnimalModel.fromMap(Map<String, dynamic> map) {
    return SpeciesAnimalModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeciesAnimalModel.fromJson(String source) =>
      SpeciesAnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpeciesAnimalModel(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant SpeciesAnimalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
