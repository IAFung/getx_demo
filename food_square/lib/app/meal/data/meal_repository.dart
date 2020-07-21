import 'meal.dart';
import 'meal_provider.dart';
import 'package:meta/meta.dart';

class MealRepository {
  final MealProvider provider;

  MealRepository({@required this.provider}) : assert(provider != null);

  Future<List<MealElement>> getList() async {
    return provider.getList();
  }
}
