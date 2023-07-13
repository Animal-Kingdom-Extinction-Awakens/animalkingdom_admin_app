import 'package:animalkingdom_admin_app/app/entities/animal.dart';

sealed class AnimalState {}

final class AnimalStart implements AnimalState {}

final class AnimalSuccess implements AnimalState {
  final List<Animal> lsAnimal;
  const AnimalSuccess(this.lsAnimal);
}

final class AnimalLoading implements AnimalState {}

final class AnimalFailed implements AnimalState {
  final String message;
  const AnimalFailed(this.message);
}
