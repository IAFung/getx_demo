import 'package:food_square/app/filter/bindings/filter_bindings.dart';

import '../meal/bindings/meal_bindings.dart';

import '../details/pages/details_page.dart';
import '../favor/bindings/favor_bindings.dart';
import '../home/bindings/home_bindings.dart';
import '../main/bindings/main_bindings.dart';

import '../main/pages/main_page.dart';
import '../meal/pages/meal_page.dart';
import '../filter/pages/filter_page.dart';

import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => MainPage(), bindings: [
      MainBindings(),
      HomeBinding(),
      FavorBinding(),
      FilterBinding()
    ]),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsPage(),
    ),
    GetPage(name: Routes.MEAL, page: () => MealPage(), binding: MealBinding()),
    GetPage(
        name: Routes.FILTER, page: () => FilterPage(), fullscreenDialog: true),

    // GetPage(name: Routes.DETAILS, page:()=> ,
  ];
}
