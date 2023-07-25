
// ignore_for_file: lines_longer_than_80_chars

import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_detail_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_form_create_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_form_edit_state.dart';
import 'package:animalkingdom_admin_app/src/interactor/states/animal_state.dart';
import 'package:asp/asp.dart';

// atoms
final animalState = Atom<AnimalState>(AnimalState.start());
final animalDetailState = Atom<AnimalDetailState>(AnimalDetailState.start());
final animalFormCreateState = Atom<AnimalFormCreateState>(AnimalFormCreateState.start());
final animalFormEditState = Atom<AnimalFormEditState>(AnimalFormEditState.start());

// actions
final fetchAnimalsAction = Atom.action();
final fetchAnimalByIdAction = Atom<String?>(null);
final fetchAnimalFormCreateAction = Atom.action();
final createAnimalAction = Atom<AnimalForm?>(null);
final deleteAnimalByIdAction = Atom<String?>(null);
final fetchAnimalFormEditAction = Atom<String?>(null);
final editAnimalAction = Atom<AnimalForm?>(null);
