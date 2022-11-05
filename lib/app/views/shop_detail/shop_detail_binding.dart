import 'package:get/get.dart';

import 'shop_detail_controller.dart';
import 'shop_detail_service.dart';

class ShopDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopDetailService());
    Get.lazyPut(() => ShopDetailController());
  }
}
