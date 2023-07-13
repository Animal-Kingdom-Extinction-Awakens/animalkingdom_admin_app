import 'package:animalkingdom_admin_app/app/ui/views/animals/animals_module.dart';
import 'package:animalkingdom_admin_app/app/ui/views/configuration/configuration_module.dart';
import 'package:animalkingdom_admin_app/app/ui/views/home/home_page.dart';
import 'package:animalkingdom_admin_app/app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          routeHome,
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute(
          routeAnimals,
          module: AnimalsModule(),
        ),
        ModuleRoute(
          routeConfig,
          module: ConfigurationModule(),
        ),
      ];
}
