import 'package:get/get.dart';

import '../../../core/models/coffee_model.dart';

enum CoffeeDetailState { Initial, Busy, Error, Loaded }

class CoffeeDetailController extends GetxController {
  final Rx<CoffeeModel?> _coffeeModel = Rx(null);
  CoffeeModel? get coffeeModel => _coffeeModel.value;
  set coffeeModel(CoffeeModel? val) => _coffeeModel.value = val;
  @override
  void onInit() {
    fillArguments();
    super.onInit();
  }

  void fillArguments() {
    if (Get.arguments == null) return;
    if (Get.arguments['coffeeModel'] is! CoffeeModel) return;
    coffeeModel = Get.arguments['coffeeModel'];
  }
}
