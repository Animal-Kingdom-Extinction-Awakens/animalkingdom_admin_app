
import 'package:animalkingdom_admin_app/app/states/animal_state.dart';
import 'package:rx_notifier/rx_notifier.dart';

// states / atoms
final animalState = RxNotifier<AnimalState>(AnimalStart());

// actions
final fetchAnimals = RxNotifier(Object());
