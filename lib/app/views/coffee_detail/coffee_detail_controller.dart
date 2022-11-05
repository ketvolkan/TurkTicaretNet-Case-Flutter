import 'package:get/get.dart';

import '../../../core/models/coffee_model.dart';
import '../../../core/utils/extensions.dart';
import '../../route/app_routes.dart';

enum CoffeeDetailState { Initial, Busy, Error, Loaded }

class CoffeeDetailController extends GetxController {
  CoffeeModel? coffeeModel;

  final Rx<int?> _selectedSize = Rx(null);
  int? get selectedSize => _selectedSize.value;
  set selectedSize(int? val) => _selectedSize.value = val;

  final Rx<int> _selectedCount = 1.obs;
  int get selectedCount => _selectedCount.value;
  set selectedCount(int val) => _selectedCount.value = val;

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

  void changeSelectedSize(int id) {
    selectedSize = id;
  }

  void addToCardOnTap() {
    if (selectedCount < 1 || selectedSize is! int) {
      Get.showToast("Please Choose", toastStyle: ToastStyle.WARNING);
      return;
    }
    Get.toNamed(AppRoutes.CartDetail, arguments: {
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
