import 'home_provider.dart';
import 'category.dart';

class HomeRepository {
  HomeRepository(this.homeProvider);
  final HomeProvider homeProvider;

  Future<List<CategoryElement>> getList() async {
    return homeProvider.getList();
  }
}
