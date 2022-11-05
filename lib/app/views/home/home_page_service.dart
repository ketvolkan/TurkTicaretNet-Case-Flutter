import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../core/models/coffee_model.dart';
import '../../../core/models/shop_model.dart';
import '../../../core/utils/utils.dart';

class HomePageService extends GetxService {
  Future<List<CoffeeModel>> getAllCoffee() async {
    var result = await FirebaseFirestore.instance.collection('Coffees').get();
    List<CoffeeModel> coffeeList = [];
    for (var element in convertToList(result)) {
      coffeeList.add(CoffeeModel.fromJson(element));
    }
    return coffeeList;
  }

  Future<List<ShopModel>> getAllShop() async {
    var result = await FirebaseFirestore.instance.collection('Shops').get();
    List<ShopModel> shopList = [];
    for (var element in convertToList(result)) {
      shopList.add(ShopModel.fromJson(element));
    }
    return shopList;
  }
}
