import 'package:animalkingdom_admin_app/src/data/services/animal_service_impl.dart';
import 'package:animalkingdom_admin_app/src/interactor/reducers/animal_reducer.dart';
import 'package:animalkingdom_admin_app/src/interactor/services/animal_service.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/animals/animals_create_page.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/animals/animals_edit_page.dart';
import 'package:animalkingdom_admin_app/src/ui/pages/animals/animals_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

class AnimalsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Uno>(Uno()),
        AutoBind.singleton<AnimalService>(AnimalServiceImpl.new),
        AutoBind.singleton(AnimalReducer.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const AnimalsPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/create',
          child: (context, args) => const AnimalsCreatePage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/edit/:id',
          child: (context, args) => AnimalsEditPage(id: args.params['id']),
          transition: TransitionType.noTransition,
        ),
      ];
}
