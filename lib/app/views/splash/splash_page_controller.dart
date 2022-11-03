import 'package:get/get.dart';

import '../../route/app_routes.dart';

class SplashPageController extends GetxController {
  Future<bool> splashEnd() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.HOME);
    });
    return true;
  }
}
