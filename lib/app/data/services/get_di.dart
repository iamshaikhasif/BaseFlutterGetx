import 'package:base_project_getx/app/data/services/data_repositry.dart';
import 'package:base_project_getx/app/ui/splash/splash_controller.dart';
import 'package:base_project_getx/core/network/api_client.dart';
import 'package:get/get.dart';

class DiBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(DataRepository(Get.find()));
    Get.lazyPut(() => SplashController(Get.find()));
  }

}