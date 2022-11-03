import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/coffee_model.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../widgets/custom_text.dart';

class CoffeeListItem extends StatelessWidget {
  final CoffeeModel coffeeModel;
  const CoffeeListItem({super.key, required this.coffeeModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.6,
      child: Padding(
        padding: EdgeInsets.all(Utils.normalPadding),
        child: Column(
          children: [
            Expanded(child: imageSection()),
            SizedBox(height: Utils.highPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CustomText.high(coffeeModel.name, bold: true), CustomText.high("₺${coffeeModel.price}", bold: true)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined, color: Colors.grey),
                CustomText(
                  coffeeModel.coffeeShopName,
                  textColor: Colors.grey,
                  bold: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DecoratedBox imageSection() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Utils.extraHighRadius)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(10, 20))],
        image: DecorationImage(image: NetworkImage(coffeeModel.imageUrl ?? AppConstants.notFoundImage), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [favoriteButton(), deliveryTimeAndRating()],
      ),
    );
  }

  Padding deliveryTimeAndRating() {
    return Padding(
      padding: EdgeInsets.all(Utils.lowPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.timer_outlined, color: getReversedTextColor, size: Utils.normalIconSize * 0.8),
              SizedBox(width: Utils.extraLowPadding),
              CustomText.low("${coffeeModel.deliveryTime} min delivery", textColor: getReversedTextColor)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.orangeAccent, size: Utils.normalIconSize * 0.8),
              SizedBox(width: Utils.extraLowPadding),
              CustomText.low("${coffeeModel.rating}", textColor: getReversedTextColor)
            ],
          ),
        ],
      ),
    );
  }

  Align favoriteButton() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: CircleAvatar(
              backgroundColor: getReversedTextColor.withOpacity(0.3),
              child: Icon(Icons.favorite_outline, color: getReversedTextColor)),
          onPressed: () {}),
    );
  }
}
