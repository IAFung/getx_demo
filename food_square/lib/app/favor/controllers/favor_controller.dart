import 'package:food_square/app/filter/controllers/filter_controller.dart';
import 'package:food_square/app/meal/data/meal.dart';
import 'package:get/get.dart';

class FavorController extends GetxController {
  final FilterController filter = Get.find();
  final _list = List<MealElement>().obs;
  set list(List<MealElement> value) => this._list.value = value;
  List<MealElement> get list => this._list.value.where((element) {
        if (filter.isLactoseFree && !element.isLactoseFree) return false;
        if (filter.isVegan && !element.isVegan) return false;
        if (filter.isVegetarian && !element.isVegetarian) return false;
        if (filter.isGlutenFree && !element.isGlutenFree) return false;
        return true;
      }).toList();

  updateElement(MealElement element) {
    if (this.list.contains(element)) {
      _list.remove(element);
    } else {
      _list.add(element);
    }
  }
}

extension Favor on MealElement {
  bool get containsElement => Get.find<FavorController>().list.contains(this);
}
