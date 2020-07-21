import '../../common/utils/json_parser.dart';

import "category.dart";

class HomeProvider {
  Future<List<CategoryElement>> getList() async {
    final map = await JSONParser.getJsonData("category");
    List<CategoryElement> list = Category.fromJson(map).category;
    return list;
  }
}
