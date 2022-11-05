import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../core/constants/app_constants.dart';
import '../../route/app_routes.dart';
import '../../widgets/others/custom_scaffold.dart';
import '../../widgets/text/custom_text.dart';
import 'cart_process_controller.dart';

class CartProcessView extends GetView<CartProcessController> {
  const CartProcessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSingleChildScrollView: false,
      body: Padding(
        padding: EdgeInsets.only(top: Utils.normalPadding),
        child: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Utils.extraHighPadding),
                  child: Image.asset(
                    controller.success ? AppConstants.orderSuccessGif : AppConstants.orderProcessGif,
                    height: Get.width * 1,
                    width: Get.width * 1,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                CustomText.extraHigh(controller.success ? "Order Confirmed!" : "Your order is processing", bold: true),
                if (controller.success) SizedBox(height: Utils.normalPadding),
                if (controller.success)
                  InkWell(
                    onTap: () => Get.offAllNamed(AppRoutes.HOME),
                    child: CustomText("Back to the homepage", textColor: Get.theme.primaryColor, bold: true, underlined: true),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
