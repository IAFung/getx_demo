import 'package:get/get.dart';

class FilterController extends GetxController {
  // isGlutenFree: json["isGlutenFree"],
  //     isVegan: json["isVegan"],
  //     isVegetarian: json["isVegetarian"],
  //     isLactoseFree
  RxBool _isGlutenFree = false.obs;
  RxBool _isVegan = false.obs;
  RxBool _isVegetarian = false.obs;
  RxBool _isLactoseFree = false.obs;

  set isGlutenFree(bool value) => this._isGlutenFree.value = value;
  bool get isGlutenFree => this._isGlutenFree.value;

  set isVegan(bool value) => this._isVegan.value = value;
  bool get isVegan => this._isVegan.value;

  set isVegetarian(bool value) => this._isVegetarian.value = value;
  bool get isVegetarian => this._isVegetarian.value;

  set isLactoseFree(bool value) => this._isLactoseFree.value = value;
  bool get isLactoseFree => this._isLactoseFree.value;
}
