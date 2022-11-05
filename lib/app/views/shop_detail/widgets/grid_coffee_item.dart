import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkticaretnetcase/app/widgets/text/custom_text.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/coffee_model.dart';
import '../../../../core/utils/utils.dart';

class GridCoffeeItem extends StatelessWidget {
  final CoffeeModel coffeeModel;
  const GridCoffeeItem({super.key, required this.coffeeModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Utils.highRadius),
          child: Image.network(
            coffeeModel.imageUrl ?? AppConstants.notFoundImage,
            fit: BoxFit.cover,
            height: Get.width * 0.6,
            width: Get.width * 0.45,
          ),
        ),
        CustomText.high(coffeeModel.name, bold: true),
        CustomText("₺ ${coffeeModel.price}"),
      ],
    );
  }
}
