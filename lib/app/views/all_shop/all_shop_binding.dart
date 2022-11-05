import 'package:get/get.dart';

import 'all_shop_controller.dart';
import 'all_shop_service.dart';

class AllShopBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllShopService());
    Get.lazyPut(() => AllShopController());
  }
}
