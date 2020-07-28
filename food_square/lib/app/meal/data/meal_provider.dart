import 'package:food_square/app/common/utils/network/api_const.dart';

import '../../common/utils/network/http_request.dart';
import 'meal.dart';

class MealProvider {
  Future<List<MealElement>> getList() async {
    final response = await MealRequest().request();
    List<MealElement> list = Meal.fromJson(response).meal;
    return list;
  }
}

class MealRequest extends BaseRequest {
  String get path => APIConst.meat;
}
