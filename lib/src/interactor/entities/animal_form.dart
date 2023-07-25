// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:image_picker/image_picker.dart';

class AnimalForm {
  int? id;
  String? name;
  String? description;
  int? idSpecie;
  int? idRarity;
  XFile? image;

  AnimalForm({
    this.id,
    this.name,
    this.description,
    this.idSpecie,
    this.idRarity,
    this.image,
  });
}
