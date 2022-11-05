import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/shop_model.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text/rating_text.dart';

class ShopListItem extends StatelessWidget {
  final ShopModel shopModel;
  const ShopListItem({super.key, required this.shopModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: imageSection),
        SizedBox(height: Utils.lowPadding),
        CustomText(shopModel.name, bold: true),
        RatingText(
          rating: shopModel.rating ?? 0,
          ratingCount: shopModel.ratingCount,
          size: Utils.lowIconSize,
          color: Colors.grey,
        ),
      ],
    );
  }

  Stack get imageSection {
    return Stack(
      children: [
        SizedBox(
          width: Get.width * 0.42,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Utils.highRadius),
            child: Image.network(shopModel.imageUrl ?? AppConstants.notFoundImage, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 0,
          child: ClipRRect(
            borderRadius:
                BorderRadius.only(topRight: Radius.circular(Utils.highRadius), bottomLeft: Radius.circular(Utils.highRadius)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Padding(
                padding: EdgeInsets.all(Utils.extraLowPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined, color: getReversedTextColor),
                    CustomText("1.6 Km", textColor: getReversedTextColor)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
