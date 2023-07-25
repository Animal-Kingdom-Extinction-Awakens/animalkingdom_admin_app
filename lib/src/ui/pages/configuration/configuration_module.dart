import 'package:animalkingdom_admin_app/src/interactor/reducers/configuration_reducer.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/configuration/configuration_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigurationModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [AutoBind.singleton(ConfigurationReducer.new)];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ConfigurationPage(),
        )
      ];
}
