
// ignore_for_file: public_member_api_docs, sort_constructors_first

class Specie {
  final int id;
  final String name;
  final String? description;
  
  const Specie({
    required this.id,
    required this.name,
    this.description,
  });

  factory Specie.empty() {
    return const Specie(
      id: 0,
      name: '',
      description: '',
    );
  }
}
