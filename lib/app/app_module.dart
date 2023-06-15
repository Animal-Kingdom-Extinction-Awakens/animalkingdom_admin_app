import 'package:animalkingdom_admin_app/app/search/presenter/atoms/app_store.dart';
import 'package:animalkingdom_admin_app/app/search/presenter/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AutoBind.singleton(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
