import 'package:animalkingdom_admin_app/app/search/infra/models/animal_model.dart';

abstract class AnimalDatasource {

  Future<List<AnimalModel>> getAnimals();

}
