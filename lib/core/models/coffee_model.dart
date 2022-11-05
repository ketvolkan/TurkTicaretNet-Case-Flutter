class CoffeeModel {
  String? deliveryTime;
  String? coffeeShopName;
  double? price;
  String? imageUrl;
  String? name;
  double? rating;
  String? detail;
  List<String>? chooseList;

  CoffeeModel(
      {this.deliveryTime, this.coffeeShopName, this.price, this.imageUrl, this.name, this.rating, this.detail, this.chooseList});

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    deliveryTime = json['deliveryTime'];
    coffeeShopName = json['coffeeShopName'];
    price = json['price']?.toDouble();
    imageUrl = json['imageUrl'];
    name = json['name'];
    rating = json['rating']?.toDouble();
    detail = json['detail'];
    chooseList = json['chooseList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryTime'] = deliveryTime;
    data['coffeeShopName'] = coffeeShopName;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['rating'] = rating;
    data['detail'] = detail;
    data['chooseList'] = chooseList;
    return data;
  }
}
