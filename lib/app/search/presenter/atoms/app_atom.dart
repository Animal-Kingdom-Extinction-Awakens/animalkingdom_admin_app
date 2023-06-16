import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

// states / atoms
final themeModeAtom = RxNotifier<ThemeMode>(ThemeMode.light);

// actions
final changeThemeModeAction = RxNotifier<ThemeMode>(ThemeMode.system);
