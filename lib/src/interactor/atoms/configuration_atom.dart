import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

// atoms
final themeModeAtom = Atom<ThemeMode>(ThemeMode.system);

// actions
final changeThemeModeAction = Atom<ThemeMode>(ThemeMode.system);
