import '../data/home_provider.dart';
import '../data/home_repository.dart';
import '../controllers/home_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(repository: HomeRepository(HomeProvider())));
  }
}
