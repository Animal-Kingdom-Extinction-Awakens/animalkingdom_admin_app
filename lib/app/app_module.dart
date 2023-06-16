import 'package:animalkingdom_admin_app/app/search/presenter/home/home_module.dart';
import 'package:animalkingdom_admin_app/app/search/presenter/reducers/app_reducer.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AutoBind.singleton(AppReducer.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
