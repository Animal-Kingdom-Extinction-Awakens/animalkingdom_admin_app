import 'package:animalkingdom_admin_app/app/reducers/animal_reducer.dart';
import 'package:animalkingdom_admin_app/app/repositories/animal_repository.dart';
import 'package:animalkingdom_admin_app/app/ui/views/animals/animals_page.dart';
import 'package:animalkingdom_admin_app/app/usecases/get_animals.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

class AnimalsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Uno>(Uno()),
        AutoBind.singleton<AnimalRepository>(AnimalRepositoryImpl.new),
        AutoBind.singleton<GetAnimals>(GetAnimalsImpl.new),
        AutoBind.singleton(AnimalReducer.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const AnimalsPage(),
        ),
      ];
}
