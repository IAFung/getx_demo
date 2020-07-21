import '../controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
