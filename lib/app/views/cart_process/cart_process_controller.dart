import 'package:get/get.dart';

import '../../../core/models/coffee_model.dart';

enum CartProcessState { Initial, Busy, Error, Loaded }

class CartProcessController extends GetxController {
  final Rx<bool> _success = false.obs;
  bool get success => _success.value;
  set success(bool val) => _success.value = val;

  CoffeeModel? coffeeModel;

  int selectedCount = 1;

  int? selectedSize;

  @override
  void onInit() {
    fillArguments();
    super.onInit();
  }

  void fillArguments() {
    if (Get.arguments == null) return;
    if (Get.arguments['coffeeModel'] is CoffeeModel) coffeeModel = Get.arguments['coffeeModel'];
    if (Get.arguments['selectedCount'] is int) selectedCount = Get.arguments['selectedCount'];
    if (Get.arguments['selectedSize'] is int) selectedSize = Get.arguments['selectedSize'];
  }

  @override
  void onReady() {
    processEndSimulate();
    super.onReady();
  }

//! işlemin onaylanmasını simüle ettim
  Future<bool> processEndSimulate() async {
    await Future.delayed(const Duration(seconds: 5), () {
      success = true;
    });
    return true;
  }
}
