// ignore_for_file: public_member_api_docs, sort_constructors_first

class Rarity {
  final int id;
  final String name;

  const Rarity({
    required this.id,
    required this.name,
  });

  factory Rarity.empty() {
    return const Rarity(
      id: 0,
      name: '',
    );
  }
}
