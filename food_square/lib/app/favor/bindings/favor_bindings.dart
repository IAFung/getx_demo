import '../controllers/favor_controller.dart';
import 'package:get/get.dart';

class FavorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavorController>(() => FavorController());
  }
}
