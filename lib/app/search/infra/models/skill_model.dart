// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:animalkingdom_admin_app/app/search/domain/entities/skill.dart';

class SkillModel extends Skill {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  SkillModel({
    required this.id,
    required this.name,
    required this.description,
  }) : super(id: id, name: name, description: description);

  SkillModel copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return SkillModel(
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

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) =>
      SkillModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SkillModel(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant SkillModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
