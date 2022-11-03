import 'package:get/get.dart';
import 'coffee_detail_service.dart';
import 'coffee_detail_controller.dart';

class CoffeeDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoffeeDetailService());
    Get.lazyPut(() => CoffeeDetailController());
  }
}
