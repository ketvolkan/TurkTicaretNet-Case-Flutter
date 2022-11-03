import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../../widgets/custom_text.dart';
import 'splash_page_controller.dart';

class SplashPageView extends GetView<SplashPageController> {
  const SplashPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.splashEnd();
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: DecoratedBox(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppConstants.splashJpg), fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.custom(
                    "Cup ",
                    textColor: getReversedTextColor,
                    textSize: Utils.extraHighTextSize * 2,
                    fontFamily: "Comic",
                    bold: true,
                  ),
                  CustomText.custom(
                    "Coffee",
                    textColor: "FFB067".toColor(),
                    textSize: Utils.extraHighTextSize * 2,
                    fontFamily: "Comic",
                    bold: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
