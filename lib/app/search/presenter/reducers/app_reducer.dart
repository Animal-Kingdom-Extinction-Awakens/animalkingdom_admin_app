import 'package:animalkingdom_admin_app/app/search/presenter/atoms/app_atom.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppReducer extends RxReducer {
  AppReducer() {
    on(() => [changeThemeModeAction.value], changeThemeMode);
  }

  void changeThemeMode() {
    themeModeAtom.value = changeThemeModeAction.value;
  }
}
