import 'package:get/instance_manager.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DetailController>(() => DetailController(
    //     repository: MyRepository(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
