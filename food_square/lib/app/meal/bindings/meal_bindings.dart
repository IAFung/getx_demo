import '../data/meal_provider.dart';
import '../data/meal_repository.dart';
import '../controllers/meal_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class MealBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MealController>(() =>
        MealController(repository: MealRepository(provider: MealProvider())));
  }
}
