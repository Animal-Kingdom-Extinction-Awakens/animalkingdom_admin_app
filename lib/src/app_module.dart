import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/animals/animals_module.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/configuration/configuration_module.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          routeHome,
          child: (context, args) => const HomePage(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          routeAnimals,
          module: AnimalsModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          routeConfig,
          module: ConfigurationModule(),
          transition: TransitionType.noTransition,
        ),
      ];
}
