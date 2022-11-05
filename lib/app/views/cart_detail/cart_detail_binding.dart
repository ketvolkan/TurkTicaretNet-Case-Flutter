import 'package:get/get.dart';

import 'cart_detail_controller.dart';
import 'cart_detail_service.dart';

class CartDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartDetailService());
    Get.lazyPut(() => CartDetailController());
  }
}
