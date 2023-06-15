// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// RxGenerator
// **************************************************************************

class AppStore = _AppStore with _AppStoreMixin;

mixin _AppStoreMixin on _AppStore {
  ///
  /// GENERATED themeMode(ThemeMode)
  ///

  late final _themeModeRx = RxNotifier<ThemeMode>(super.themeMode);
  RxValueListenable<ThemeMode> get themeModeListenable => _themeModeRx;

  @override
  set themeMode(ThemeMode _themeModeValue) =>
      _themeModeRx.value = _themeModeValue;
  @override
  ThemeMode get themeMode => _themeModeRx.value;
}
