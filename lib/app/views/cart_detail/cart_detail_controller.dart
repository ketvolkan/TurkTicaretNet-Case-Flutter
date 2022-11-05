import 'package:get/get.dart';

import '../../../core/models/coffee_model.dart';
import '../../route/app_routes.dart';

enum CartDetailState { Initial, Busy, Error, Loaded }

class CartDetailController extends GetxController {
  CoffeeModel? coffeeModel;

  final Rx<int> _selectedCount = 1.obs;
  int get selectedCount => _selectedCount.value;
  set selectedCount(int val) => _selectedCount.value = val;

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

  void payNowButtonOnTap() {
    Get.toNamed(AppRoutes.CartProcess, arguments: {
      "selectedSize": selectedSize,
      "selectedCount": selectedCount,
      "coffeeModel": coffeeModel,
    });
  }

  void countChange({bool increment = false}) {
    if (increment) {
      selectedCount++;
      return;
    }
    if (selectedCount == 1) return;
    selectedCount--;
  }
}
