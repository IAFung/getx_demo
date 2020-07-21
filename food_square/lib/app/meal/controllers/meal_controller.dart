import 'package:food_square/app/filter/controllers/filter_controller.dart';

import '../data/meal.dart';
import '../data/meal_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MealController extends GetxController {
  final FilterController filter = Get.find();
  final MealRepository repository;
  MealController({@required this.repository}) : assert(repository != null);

  final _list = List<MealElement>().obs;
  set list(List<MealElement> value) => this._list.value = value;
  List<MealElement> get list => this._list.value;
  final _isLoading = false.obs;
  set isLoading(bool value) => this._isLoading.value = value;
  bool get isLoading => this._isLoading.value;

  getList(String id) async {
    this.isLoading = true;
    List<MealElement> tempList = await repository.getList();
    this.list = tempList
        .where((element) => element.categories.contains(id))
        .where((element) {
      if (filter.isLactoseFree && !element.isLactoseFree) return false;
      if (filter.isVegan && !element.isVegan) return false;
      if (filter.isVegetarian && !element.isVegetarian) return false;
      if (filter.isGlutenFree && !element.isGlutenFree) return false;
      return true;
    }).toList();
    this.isLoading = false;
  }
}
