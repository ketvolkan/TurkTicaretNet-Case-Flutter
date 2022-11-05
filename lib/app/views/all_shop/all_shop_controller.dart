import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/models/shop_model.dart';
import 'all_shop_service.dart';

enum AllShopState { Initial, Busy, Error, Loaded }

class AllShopController extends GetxController {
  final _allShopService = Get.find<AllShopService>();

  final Rx<AllShopState> _state = AllShopState.Initial.obs;
  AllShopState get state => _state.value;
  set state(AllShopState val) => _state.value = val;

  final RxList<ShopModel> _shopList = <ShopModel>[].obs;
  List<ShopModel> get shopList => _shopList.value;
  set shopList(List<ShopModel> val) => _shopList.value = val;

  final Rx<int> _selectedId = 0.obs;
  int get selectedId => _selectedId.value;
  set selectedId(int val) => _selectedId.value = val;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(40.991039, 28.649815),
    zoom: 14.4746,
  );
  @override
  void onReady() async {
    await getShopList();
  }

  Future<void> getShopList() async {
    try {
      state = AllShopState.Busy;
      shopList = await _allShopService.getAllShop();
      state = AllShopState.Loaded;
    } catch (e) {
      state = AllShopState.Error;
    }
  }
}
