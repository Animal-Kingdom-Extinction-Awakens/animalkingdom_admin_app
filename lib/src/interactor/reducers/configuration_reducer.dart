import 'package:animalkingdom_admin_app/src/interactor/atoms/configuration_atom.dart';
import 'package:asp/asp.dart';

class ConfigurationReducer extends Reducer {
  ConfigurationReducer() {
    on(() => [changeThemeModeAction], changeThemeMode);
  }

  void changeThemeMode() {
    themeModeAtom.value = changeThemeModeAction.value;
  }
}
