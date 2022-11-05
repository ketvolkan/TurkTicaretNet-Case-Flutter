import 'package:get/get.dart';

import 'home_page_controller.dart';
import 'home_page_service.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageService());
    Get.lazyPut(() => HomePageController());
  }
}
