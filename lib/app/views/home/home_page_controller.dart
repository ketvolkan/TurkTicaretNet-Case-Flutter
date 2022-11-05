import 'package:get/get.dart';
import 'package:turkticaretnetcase/app/views/home/home_page_service.dart';

import '../../../core/models/coffee_model.dart';
import '../../../core/models/shop_model.dart';

enum HomePageState { Initial, Busy, Error, Loaded }

class HomePageController extends GetxController {
  final HomePageService _homePageService = Get.find<HomePageService>();
  final RxList<CoffeeModel> _coffeeList = <CoffeeModel>[].obs;
  List<CoffeeModel> get coffeeList => _coffeeList.value;
  set coffeeList(List<CoffeeModel> val) => _coffeeList.value = val;
  final Rx<HomePageState> _state = HomePageState.Initial.obs;
  HomePageState get state => _state.value;
  set state(HomePageState val) => _state.value = val;
  final RxList<ShopModel> _shopList = <ShopModel>[].obs;
  List<ShopModel> get shopList => _shopList.value;
  set shopList(List<ShopModel> val) => _shopList.value = val;

  @override
  void onReady() async {
    await getCoffeeList();
    await getShopList();
  }

  Future<void> getCoffeeList() async {
    try {
      state = HomePageState.Busy;
      coffeeList = await _homePageService.getAllCoffee();
      state = HomePageState.Loaded;
    } catch (e) {
      state = HomePageState.Error;
    }
  }

  Future<void> getShopList() async {
    try {
      state = HomePageState.Busy;
      shopList = await _homePageService.getAllShop();
      state = HomePageState.Loaded;
    } catch (e) {
      state = HomePageState.Error;
    }
  }
}
