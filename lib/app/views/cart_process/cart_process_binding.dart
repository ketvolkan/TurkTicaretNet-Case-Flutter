import 'package:get/get.dart';

import 'cart_process_controller.dart';
import 'cart_process_service.dart';

class CartProcessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartProcessService());
    Get.lazyPut(() => CartProcessController());
  }
}
