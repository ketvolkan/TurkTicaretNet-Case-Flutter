import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../buttons/custom_square_icon_button.dart';
import '../text/custom_text.dart';

class CoffeeCountSelection extends StatelessWidget {
  final int count;
  final Function() incerement;
  final Function() reduce;
  final double? dimension;
  final double? padding;
  const CoffeeCountSelection(
      {super.key, required this.count, required this.incerement, required this.reduce, this.dimension, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Utils.normalPadding),
      child: Row(
        children: [
          CustomSquareIconButton(
            dimension: dimension,
            backgroundColor: Get.theme.primaryColor.withOpacity(0.1),
            iconColor: Get.theme.primaryColor,
            icon: Icons.remove,
            onTap: reduce,
          ),
          SizedBox(width: padding ?? Utils.extraHighPadding * 1.2),
          CustomText.high(count.toString()),
          SizedBox(width: padding ?? Utils.extraHighPadding * 1.2),
          CustomSquareIconButton(
            dimension: dimension,
            backgroundColor: Get.theme.primaryColor.withOpacity(0.75),
            iconColor: getReversedTextColor,
            icon: Icons.add,
            onTap: incerement,
          ),
        ],
      ),
    );
  }
}
