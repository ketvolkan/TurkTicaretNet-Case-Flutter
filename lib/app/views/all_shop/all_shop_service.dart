import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:turkticaretnetcase/core/models/shop_model.dart';
import 'package:turkticaretnetcase/core/utils/utils.dart';

class AllShopService extends GetxService {
  Future<List<ShopModel>> getAllShop() async {
    var result = await FirebaseFirestore.instance.collection('Shops').get();
    List<ShopModel> shopList = [];
    for (var element in convertToList(result)) {
      shopList.add(ShopModel.fromJson(element));
    }
    return shopList;
  }
}
