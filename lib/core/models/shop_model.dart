import 'package:cloud_firestore/cloud_firestore.dart';
import 'coffee_model.dart';

class ShopModel {
  String? imageUrl;
  List<CoffeeModel>? coffees;
  double? rating;
  String? name;
  String? location;
  String? detail;
  int? ratingCount;
  String? slogan;

  ShopModel({this.imageUrl, this.coffees, this.rating, this.name, this.location, this.detail, this.ratingCount, this.slogan});

  ShopModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    if (json['coffees'] != null) {
      coffees = <CoffeeModel>[];
      json['coffees'].forEach((v) async {
        final result = await FirebaseFirestore.instance.doc(v.path).get();
        coffees!.add(CoffeeModel.fromJson((result.data() ?? {})));
      });
    }
    rating = json['rating']?.toDouble();
    name = json['name'];
    location = json['location'];
    detail = json['detail'];
    ratingCount = json['ratingCount'];
    slogan = json['slogan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    if (coffees != null) {
      data['coffees'] = coffees!.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    data['name'] = name;
    data['location'] = location;
    data['detail'] = detail;
    data['ratingCount'] = ratingCount;
    data['slogan'] = slogan;
    return data;
  }
}
