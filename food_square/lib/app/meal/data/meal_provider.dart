import '../../common/utils/http_request.dart';
import 'meal.dart';

class MealProvider {
  Future<List<MealElement>> getList() async {
    final response = await HttpRequest.instance.request("meal.json");
    List<MealElement> list = Meal.fromJson(response).meal;
    return list;
  }
}
