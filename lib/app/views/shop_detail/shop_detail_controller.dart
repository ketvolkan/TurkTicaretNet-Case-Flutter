import 'package:get/get.dart';

import '../../../core/models/shop_model.dart';

enum ShopDetailState { Initial, Busy, Error, Loaded }

class ShopDetailController extends GetxController {
  ShopModel? shopModel;

  final Rx<int> _selectedId = 0.obs;
  int get selectedId => _selectedId.value;
  set selectedId(int val) => _selectedId.value = val;

  @override
  void onInit() {
    fillArguments();
    super.onInit();
  }

  void fillArguments() {
    if (Get.arguments == null) return;
    if (Get.arguments['shopModel'] is! ShopModel) return;
    shopModel = Get.arguments['shopModel'];
  }
}
