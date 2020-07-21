import '../data/category.dart';
import '../data/home_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);

  final _list = List<CategoryElement>().obs;
  set list(List<CategoryElement> value) => this._list.value = value;
  List<CategoryElement> get list => this._list.value;

  @override
  void onInit() => _getList();

  _getList() async {
    this.list = await repository.getList();
  }
}
