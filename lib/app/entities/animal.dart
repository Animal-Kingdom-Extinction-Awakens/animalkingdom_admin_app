// ignore_for_file: lines_longer_than_80_chars

class Animal {
  int id;
  String name;
  String? description;
  String specie;
  String rarity;

  Animal({
    required this.id,
    required this.name,
    this.description,
    required this.specie,
    required this.rarity,
  });

  @override
  String toString() {
    return 'Animal(id: $id, name: $name, description: $description, specie: $specie, rarity: $rarity)';
  }
}
