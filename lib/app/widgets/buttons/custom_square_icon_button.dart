import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';

class CustomSquareIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? dimension;
  final double? padding;
  const CustomSquareIconButton(
      {super.key, required this.onTap, required this.icon, this.backgroundColor, this.dimension, this.iconColor, this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox.square(
        dimension: dimension ?? Get.width * 0.12,
        child: FittedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Utils.normalRadius),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Padding(padding: EdgeInsets.all(padding ?? Utils.extraHighPadding), child: Icon(icon, color: iconColor)),
            ),
          ),
        ),
      ),
    );
  }
}
