import 'package:animalkingdom_admin_app/app/atoms/configuration_atom.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationReducer extends RxReducer {
  ConfigurationReducer() {
    on(() => [changeThemeModeAction.value], changeThemeMode);
  }

  void changeThemeMode() {
    themeModeAtom.value = changeThemeModeAction.value;
  }
}
