import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  const CustomCard({super.key, this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        elevation: Utils.normalPadding * 2,
        shadowColor: Get.theme.primaryColor,
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(Utils.normalRadius),
        child: Padding(
          padding: EdgeInsets.all(Utils.normalPadding),
          child: child,
        ),
      ),
    );
  }
}
