import '../controllers/filter_controller.dart';
import 'package:get/get.dart';

class FilterBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<FilterController>(() => FilterController(), fenix: true);
    Get.put(FilterController(), permanent: true);
  }
}
