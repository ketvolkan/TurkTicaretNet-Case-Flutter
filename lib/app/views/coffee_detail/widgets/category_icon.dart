import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';
import '../../../widgets/custom_svg_image.dart';

class CategoryIcon extends StatelessWidget {
  final String iconSvg;
  const CategoryIcon({super.key, required this.iconSvg});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Utils.normalRadius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor.withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.all(Utils.extraHighPadding),
          child: CustomSvgImage(
            svgPath: iconSvg,
            height: Get.width * 0.075,
            color: Get.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
