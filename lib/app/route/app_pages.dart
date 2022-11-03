import 'package:get/get.dart';

import '../views/home/home_page_bindings.dart';
import '../views/home/home_page_view.dart';
import '../views/splash/splash_page_binding.dart';
import '../views/splash/splash_page_view.dart';
import 'app_routes.dart';

class AppPages {
  static var PAGES = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
