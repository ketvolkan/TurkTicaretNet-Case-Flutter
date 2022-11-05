import 'package:get/get.dart';

import '../../../core/models/shop_model.dart';

enum AllShopState { Initial, Busy, Error, Loaded }

class AllShopController extends GetxController {
  final RxList<ShopModel> _shopList = <ShopModel>[].obs;
  List<ShopModel> get shopList => _shopList.value;
  set shopList(List<ShopModel> val) => _shopList.value = val;

  final Rx<int> _selectedId = 0.obs;
  int get selectedId => _selectedId.value;
  set selectedId(int val) => _selectedId.value = val;

  @override
  void onReady() async {
    await getShopList();
  }

  Future<void> getShopList() async {
    shopList = [
      ShopModel(
        1,
        "Asley Coffe",
        "",
        3.2,
        123,
        "https://s3-alpha-sig.figma.com/img/e207/0aa3/ec1e88d1c7986451d1f12114ae111765?Expires=1668384000&Signature=YEdpLri3n4KOan1FlBB4ny5idcJbyzERpNEkk4lVZgsLp~xCfqSXdYNB~0iovszIJLes4POCzpun2K71AaSG7b1~p1T5qe7bkPRguWJW6vhc2WhaOsKBrCBFV9YM3qym3ke31A~6YZK~u05ZDdlrsyKAZ8o1O3UljwiuoiMbFZm6Xf17o0hI9AHf~809Rvm-OcI1dNQQwvk7rYSKgnhHSJYBYEdspz7FP-YwNi0jwL7gD8~unIAVcO7h8EFKAj7od1ngqksVo60BJ~pu87h1-cNZi2tYPpbIhLeEGsvkt9nvveBXttJzLR-wSCSc7aMvOPIMxyslwXE~XaK~GsYfEQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        "Special coffee and cakes ",
        "Find the best place to hang out with friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        2,
        "Old Town Coffe",
        "",
        4.1,
        323,
        "https://s3-alpha-sig.figma.com/img/c46a/fea0/addd50c26eb105bf4d403eef63486ff1?Expires=1668384000&Signature=Jpvd63lmM-e87jqKMGEO44AXy4bIQxX1JmDwnpeMxupjQUgoGedYtXOPCg5HEJzczrRKVEnGtUX1iBbGAG-dHC2W8kRycaIquk612RSpWJ5C7TSYuL0dablt9erWYybPOfuxC~IgrYf0z30RJlzzsefw9qwfKd0U2~KXYdPzZtUZPaiIqXzUpQuzi4zQBm48p3Ln1yeahQy6ocjwVXKho9S0PQ62ip-HwiV1qDDBWbxW8wu2E1HmwpmEzMzue59mbcZZ2XssnyszvqRxZZl6dQj8EP6Ri3ruBAzm5viebsLE5C-lSR5pupbYGhhSi8ImJiy610zfxg3k1~rOzjKU-w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        "Bisit Best Coffee",
        "Visit Find the best place to hang out with friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        3,
        "Starbucks",
        "",
        2.6,
        126,
        "https://img.freepik.com/free-psd/coffee-cup-store-low-angle_23-2148794046.jpg?w=2000",
        "Relax Time",
        "Find the best place to hang out with friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        4,
        "Ket Coffe",
        "",
        3.2,
        123,
        "https://www.no3.com.tr/wp-content/uploads/2020/01/co-3-scaled.jpg",
        "Special coffee and cakes ",
        "Find the best place to hang out with friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        5,
        "MD Coffe",
        "",
        4.1,
        323,
        "https://images.deliveryhero.io/image/fd-tr/LH/qrrs-hero.jpg",
        "Special coffee and cakes ",
        "Friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        6,
        "Brew Mood Coffe",
        "",
        2.6,
        126,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjaZWPg_AjWuK7a-IM6ot0wjEXC1SS7z0Fz3c5nGMsnImRswamhUlwdYDdX-0agSoyTcE&usqp=CAU",
        "Special coffee and cakes ",
        "To hang out with friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        7,
        "Bako Coffe",
        "",
        3.2,
        123,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTErMq6FOUTXEmEfE-3Y-dHrp-0lFBY7_vhkQ&usqp=CAU",
        "Special coffee and cakes ",
        " to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
      ShopModel(
        8,
        "Gloria Coffe",
        "",
        4.1,
        323,
        "https://i.dunya.com/storage/old/files/2020/1/13/460415/460415.jpg",
        "Special coffee and cakes ",
        "best place to hang out with friends. Visit Find the best place to hang out with friends.Find the best place to hang out with friends. Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend ...",
      ),
    ];
  }
}
