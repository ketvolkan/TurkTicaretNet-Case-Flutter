import 'package:get/get.dart';

import '../views/all_shop/all_shop_binding.dart';
import '../views/all_shop/all_shop_view.dart';
import '../views/cart_detail/cart_detail_binding.dart';
import '../views/cart_detail/cart_detail_view.dart';
import '../views/cart_process/cart_process_binding.dart';
import '../views/cart_process/cart_process_view.dart';
import '../views/coffee_detail/coffee_detail_binding.dart';
import '../views/coffee_detail/coffee_detail_view.dart';
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
    GetPage(
      name: AppRoutes.CoffeeDetail,
      page: () => const CoffeeDetailView(),
      binding: CoffeeDetailBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.CartDetail,
      page: () => const CartDetailView(),
      binding: CartDetailBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.CartProcess,
      page: () => const CartProcessView(),
      binding: CartProcessBinding(),
    ),
    GetPage(
      name: AppRoutes.AllShop,
      page: () => const AllShopView(),
      binding: AllShopBinding(),
    ),
  ];
}
