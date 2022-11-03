import 'package:get/get.dart';
import 'splash_page_controller.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashPageController());
  }
}
