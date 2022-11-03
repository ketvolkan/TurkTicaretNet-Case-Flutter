import 'package:get/get.dart';

import '../../../core/models/coffee_model.dart';
import '../../../core/models/shop_model.dart';

enum HomePageState { Initial, Busy, Error, Loaded }

class HomePageController extends GetxController {
  final RxList<CoffeeModel> _coffeeList = <CoffeeModel>[].obs;
  List<CoffeeModel> get coffeeList => _coffeeList.value;
  set coffeeList(List<CoffeeModel> val) => _coffeeList.value = val;

  final RxList<ShopModel> _shopList = <ShopModel>[].obs;
  List<ShopModel> get shopList => _shopList.value;
  set shopList(List<ShopModel> val) => _shopList.value = val;

  @override
  void onReady() async {
    await getCoffeeList();
    await getShopList();
  }

  //Todo firebaseden çekilecek
  Future<void> getCoffeeList() async {
    coffeeList = [
      CoffeeModel(
          1,
          "https://s3-alpha-sig.figma.com/img/b6bd/d67b/7d739f3467ae46aa569e12223df838a1?Expires=1668384000&Signature=GZfSBhtZsOf4o0nVRypv0BXrjqD~VvbshRILfP8xdQuKP2nVtB2HtcXq7FDW9VNWxWxBJFbX5CdC7CMl6lS4rq8cmvRt9Yvteqb5wDy3rwZhh8uzNpdhT9xtQ5USKJoQG2xhlJileEbxIgCMoZUKGhP6SK2wZbz9yyjWkear78nQMz6lbGSSmo9kvmMpSYQvYYfZuWfVHbUXns4itd~Ju2wLJ~7SZ~YZLRoePuJCZzORSOpfn45oF997hjwXd1hgYBN35jNGDz4Ag8iJc9w30IviLiZidV39b~1VpUL8OFRncEykTrURwAnQHcUuO7i2Uk0af5P8xk-B6kp2aBq4ow__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          "10",
          "Cappuccino",
          "Coffee cafe",
          10.0,
          3.0,
          "Lsa et posuere. Vivamus ac mauris nulla. In tristique quam mauris, sed finibus mauris sodales a. Integer tempor lobortis felis, vel euismod metus fermentum sit amet. Vivamus congue tellus non ullamcorper consequat. Morbi ornare cursus nunc, sit amet imperdiet est placerat ut.In eget sapien metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque quis ante lectus. Vivamus sed justo ullamcorper, egestas magna porta, blandit purus. Sed laoreet consectetur tempor. Ut ante lectus, lobortis sit amet lectus vitae, interdum bibendum lectus. Quisque sagittis maximus lorem, ac maximus orci ultrices tempus. Duis fermentum felis eu turpis ultrices gravida. Donec pretium diam nisi, ut aliquam turpis molestie sit amet. Aliquam sollicitudin lectus non nunc facilisis, ut bibendum magna cursus."),
      CoffeeModel(
          2,
          "https://s3-alpha-sig.figma.com/img/1dfe/031a/ca0af7f31662ac72c40e2bd08531eb3e?Expires=1668384000&Signature=GSkzg-hJH1UNS3Clu9VDtowPeQlceqkQjUSu7T7XDxpySSqpxhet1x73sBTfljiiNkOu3V361irZOUgiZeHF-lgATO3kEJFNn9fqyIAa3Xvudv6u7GNGMs-zXJQ9g1n6lyKs8EV-iqskZ26ySpDX0-KAdj2RB4N64yKCEc~8Vm1SD0VRziKHUUf8OG76jIbRUUjUwUpzLWXvXXbvM80oDBzzGXYApXMncMnFmNs~6IznghoxtExkFn4HXJtYqxvXFYMOzVpa1~Eh1zWRXikyeRyEyPYqQQ3iIYrhamsa6XvkVEPoMt2LYvmsL9zh3uaCXUa~PtM7G-FUNvPe4dct2Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          "10",
          "Chocolate coffee",
          "Bunny cafe",
          10.0,
          4.0,
          "Licitur diam. Nulla id maximus est. Praesent faucibus ac massa et posuere. Vivamus ac mauris nulla. In tristique quam mauris, sed finibus mauris sodales a. Integer tempor lobortis felis, vel euismod metus fermentum sit amet. Vivamus congue tellus non ullamcorper consequat. Morbi ornare cursus nunc, sit amet imperdiet est placerat ut.In eget sapien metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque quis ante lectus. Vivamus sed justo ullamcorper, egestas magna porta, blandit purus. Sed laoreet consectetur tempor. Ut ante lectus, lobortis sit amet lectus vitae, interdum bibendum lectus. Quisque sagittis maximus lorem, ac maximus orci ultrices tempus. Duis fermentum felis eu turpis ultrices gravida. Donec pretium diam nisi, ut aliquam turpis molestie sit amet. Aliquam sollicitudin lectus non nunc facilisis, ut bibendum magna cursus."),
      CoffeeModel(
          3,
          "https://s3-alpha-sig.figma.com/img/5315/168b/07f17f5dabcfb9ff4569f6682a038074?Expires=1668384000&Signature=MnmbNZXfpc5xD0Zv4IIpJeQYqLWT-th~70gB-VGRApgsGPH18TnUxz-stSR33hn0bKbDE86la8aSJcdzvNd6iEub9ORTXkTRbBbDsyhvPhNH2GxXxt0xXWyGSwkq9vnT~~k-GCVZc6ExyaP1tKPK4TeXcjTsO5n7LjfB7wEb0nUXSqGj-dcbaqEmwBtjKJ8WSOtWBbvBZZBlbKsDj1GUN5Hyal-QsaByazBjz9kZfKXM480n1HOsIB8zCwEKwwVbYm~pUisl4QfwMMMZ34leraYqfv~up4WABIsQ~zltUXIPyjKxE98KnJrFUvKf7Ay4kn1zEWqnDQcUhaVVLrJxIA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          "10",
          "Coffee",
          "Coffee center",
          15.0,
          3.0,
          "Eu efficitur diam. Nulla id maximus est. Praesent faucibus ac massa et posuere. Vivamus ac mauris nulla. In tristique quam mauris, sed finibus mauris sodales a. Integer tempor lobortis felis, vel euismod metus fermentum sit amet. Vivamus congue tellus non ullamcorper consequat. Morbi ornare cursus nunc, sit amet imperdiet est placerat ut.In eget sapien metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque quis ante lectus. Vivamus sed justo ullamcorper, egestas magna porta, blandit purus. Sed laoreet consectetur tempor. Ut ante lectus, lobortis sit amet lectus vitae, interdum bibendum lectus. Quisque sagittis maximus lorem, ac maximus orci ultrices tempus. Duis fermentum felis eu turpis ultrices gravida. Donec pretium diam nisi, ut aliquam turpis molestie sit amet. Aliquam sollicitudin lectus non nunc facilisis, ut bibendum magna cursus."),
      CoffeeModel(
          4,
          "https://s3-alpha-sig.figma.com/img/6136/b85e/dfa14f076843573d2056041a99756297?Expires=1668384000&Signature=hXvBkYdiaWYOvtD~fti0jSnz1pCU90KCNFVDDLzQWjKCv~BseIYv1BbjM0582KXQuR4OHnmckoLjnXcMnkFQwR-B~m8XzhZ1sPVInI68eevavpsTFMFbrLuVM2C0lbOnlHVbfQseCUg2GnXRRPCkh7LfZL-PAXhY~Z-WvMf01w5GA2t9~47CJ73cyJAcpQxujh51h6~OJCWCcttQyx6tBWsWVpaAzNGnmhZaIAhNHLeoHMr7rAcxGGv05nycDg1z0VU6wSEsPuyc3I5W0xM5rdACs5KM0pE7HJZenMAWqlwOL2BM40HiXz-6aQVr54ADjiIq-uuGEnqU4fev-h1yCg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          "10",
          "Mocha",
          "Coffee cafe",
          34.0,
          4.7,
          "Maximus est. Praesent faucibus ac massa et posuere. Vivamus ac mauris nulla. In tristique quam mauris, sed finibus mauris sodales a. Integer tempor lobortis felis, vel euismod metus fermentum sit amet. Vivamus congue tellus non ullamcorper consequat. Morbi ornare cursus nunc, sit amet imperdiet est placerat ut.In eget sapien metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque quis ante lectus. Vivamus sed justo ullamcorper, egestas magna porta, blandit purus. Sed laoreet consectetur tempor. Ut ante lectus, lobortis sit amet lectus vitae, interdum bibendum lectus. Quisque sagittis maximus lorem, ac maximus orci ultrices tempus. Duis fermentum felis eu turpis ultrices gravida. Donec pretium diam nisi, ut aliquam turpis molestie sit amet. Aliquam sollicitudin lectus non nunc facilisis, ut bibendum magna cursus."),
      CoffeeModel(
          5,
          "https://s3-alpha-sig.figma.com/img/b6bd/d67b/7d739f3467ae46aa569e12223df838a1?Expires=1668384000&Signature=GZfSBhtZsOf4o0nVRypv0BXrjqD~VvbshRILfP8xdQuKP2nVtB2HtcXq7FDW9VNWxWxBJFbX5CdC7CMl6lS4rq8cmvRt9Yvteqb5wDy3rwZhh8uzNpdhT9xtQ5USKJoQG2xhlJileEbxIgCMoZUKGhP6SK2wZbz9yyjWkear78nQMz6lbGSSmo9kvmMpSYQvYYfZuWfVHbUXns4itd~Ju2wLJ~7SZ~YZLRoePuJCZzORSOpfn45oF997hjwXd1hgYBN35jNGDz4Ag8iJc9w30IviLiZidV39b~1VpUL8OFRncEykTrURwAnQHcUuO7i2Uk0af5P8xk-B6kp2aBq4ow__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          "10",
          "Cappuccino",
          "Coffee cafe",
          30.0,
          3.2,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id auctor purus, eu efficitur diam. Nulla id maximus est. Praesent faucibus ac massa et posuere. Vivamus ac mauris nulla. In tristique quam mauris, sed finibus mauris sodales a. Integer tempor lobortis felis, vel euismod metus fermentum sit amet. Vivamus congue tellus non ullamcorper consequat. Morbi ornare cursus nunc, sit amet imperdiet est placerat ut.In eget sapien metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque quis ante lectus. Vivamus sed justo ullamcorper, egestas magna porta, blandit purus. Sed laoreet consectetur tempor. Ut ante lectus, lobortis sit amet lectus vitae, interdum bibendum lectus. Quisque sagittis maximus lorem, ac maximus orci ultrices tempus. Duis fermentum felis eu turpis ultrices gravida. Donec pretium diam nisi, ut aliquam turpis molestie sit amet. Aliquam sollicitudin lectus non nunc facilisis, ut bibendum magna cursus.")
    ];
  }

  Future<void> getShopList() async {
    shopList = [
      ShopModel(1, "Asley Coffe", "", 3.2, 123,
          "https://s3-alpha-sig.figma.com/img/e207/0aa3/ec1e88d1c7986451d1f12114ae111765?Expires=1668384000&Signature=YEdpLri3n4KOan1FlBB4ny5idcJbyzERpNEkk4lVZgsLp~xCfqSXdYNB~0iovszIJLes4POCzpun2K71AaSG7b1~p1T5qe7bkPRguWJW6vhc2WhaOsKBrCBFV9YM3qym3ke31A~6YZK~u05ZDdlrsyKAZ8o1O3UljwiuoiMbFZm6Xf17o0hI9AHf~809Rvm-OcI1dNQQwvk7rYSKgnhHSJYBYEdspz7FP-YwNi0jwL7gD8~unIAVcO7h8EFKAj7od1ngqksVo60BJ~pu87h1-cNZi2tYPpbIhLeEGsvkt9nvveBXttJzLR-wSCSc7aMvOPIMxyslwXE~XaK~GsYfEQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
      ShopModel(2, "Old Town Coffe", "", 4.1, 323,
          "https://s3-alpha-sig.figma.com/img/c46a/fea0/addd50c26eb105bf4d403eef63486ff1?Expires=1668384000&Signature=Jpvd63lmM-e87jqKMGEO44AXy4bIQxX1JmDwnpeMxupjQUgoGedYtXOPCg5HEJzczrRKVEnGtUX1iBbGAG-dHC2W8kRycaIquk612RSpWJ5C7TSYuL0dablt9erWYybPOfuxC~IgrYf0z30RJlzzsefw9qwfKd0U2~KXYdPzZtUZPaiIqXzUpQuzi4zQBm48p3Ln1yeahQy6ocjwVXKho9S0PQ62ip-HwiV1qDDBWbxW8wu2E1HmwpmEzMzue59mbcZZ2XssnyszvqRxZZl6dQj8EP6Ri3ruBAzm5viebsLE5C-lSR5pupbYGhhSi8ImJiy610zfxg3k1~rOzjKU-w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
      ShopModel(3, "Pablo Artisan Coffe", "", 2.6, 126,
          "https://s3-alpha-sig.figma.com/img/e207/0aa3/ec1e88d1c7986451d1f12114ae111765?Expires=1668384000&Signature=YEdpLri3n4KOan1FlBB4ny5idcJbyzERpNEkk4lVZgsLp~xCfqSXdYNB~0iovszIJLes4POCzpun2K71AaSG7b1~p1T5qe7bkPRguWJW6vhc2WhaOsKBrCBFV9YM3qym3ke31A~6YZK~u05ZDdlrsyKAZ8o1O3UljwiuoiMbFZm6Xf17o0hI9AHf~809Rvm-OcI1dNQQwvk7rYSKgnhHSJYBYEdspz7FP-YwNi0jwL7gD8~unIAVcO7h8EFKAj7od1ngqksVo60BJ~pu87h1-cNZi2tYPpbIhLeEGsvkt9nvveBXttJzLR-wSCSc7aMvOPIMxyslwXE~XaK~GsYfEQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
    ];
  }
}
