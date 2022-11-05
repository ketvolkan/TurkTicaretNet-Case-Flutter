import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/variables/colors.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_square_icon_button.dart';
import '../../widgets/cards/custom_card.dart';
import '../../widgets/images/custom_svg_image.dart';
import '../../widgets/others/coffee_count_selection.dart';
import '../../widgets/others/custom_appbar.dart';
import '../../widgets/others/custom_scaffold.dart';
import '../../widgets/text/custom_text.dart';
import 'cart_detail_controller.dart';

class CartDetailView extends GetView<CartDetailController> {
  const CartDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSingleChildScrollView: false,
      appBar: _buildAppBar,
      body: Padding(
        padding: EdgeInsets.only(top: Utils.normalPadding),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  locationSection,
                  productSection,
                  additionSection,
                ],
              ),
            ),
            SizedBox(height: Utils.normalPadding),
            payNowButton,
            SizedBox(height: Utils.normalPadding),
          ],
        ),
      ),
    );
  }

  SizedBox get payNowButton {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.075,
      child: CustomElevatedButton(
        onTap: controller.payNowButtonOnTap,
        backgroundColor: buttonColor,
        borderRadius: Utils.normalRadius,
        child: Padding(
          padding: EdgeInsets.all(Utils.highPadding),
          child: CustomText("Pay Now", bold: true, textColor: getReversedTextColor),
        ),
      ),
    );
  }

  CustomCard get additionSection => CustomCard(
        padding: Utils.extraHighPadding,
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.25,
          child: Column(
            children: [
              additionText("Selected", (controller.coffeeModel?.name).toString(), false),
              const Divider(thickness: 2),
              additionText("Subtotal", "₺${controller.coffeeModel?.price}", false),
              const Divider(thickness: 2),
              additionText("Discount", "₺5", false),
              const Divider(thickness: 2),
              additionText("Delivery", "₺10", false),
              const Divider(thickness: 2),
              additionText("Total", "₺${(controller.coffeeModel?.price ?? 0) - 5}", true),
            ],
          ),
        ),
      );
  Widget additionText(String text, String trailing, bool bold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.high(text, bold: bold),
        CustomText.high(trailing, bold: bold),
      ],
    );
  }

  CustomCard get productSection => CustomCard(
        isPaddingZero: true,
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: Get.height * 0.125,
                    width: Get.width * 0.2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Utils.highRadius),
                        image: DecorationImage(
                            image: NetworkImage(controller.coffeeModel?.imageUrl ?? AppConstants.notFoundImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.38,
                    child: ListTile(
                        title: FittedBox(child: CustomText.high(controller.coffeeModel?.name, bold: true)),
                        subtitle: CustomText((controller.coffeeModel?.chooseList ?? [])[controller.selectedSize ?? 0],
                            textColor: Colors.grey)),
                  ),
                  Obx(
                    () => CoffeeCountSelection(
                      count: controller.selectedCount,
                      incerement: () => controller.countChange(increment: true),
                      reduce: () => controller.countChange(),
                      padding: Utils.normalPadding,
                      dimension: Utils.extraHighIconSize * 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  CustomCard get locationSection => CustomCard(
        backgroundColor: Colors.transparent,
        borderSide: BorderSide(color: buttonColor, width: 2),
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.25,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Utils.extraHighPadding, left: Utils.lowPadding),
                child: CustomSvgImage(svgPath: AppConstants.adressIconsSvg, height: Get.height * 0.155),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Get.width * 0.75,
                    child: ListTile(
                      title: CustomText.high("Hotel Diamond Palace", bold: true),
                      subtitle: CustomText("394K, Central Park, New Delhi, India", textColor: Colors.grey),
                      trailing: CustomSquareIconButton(
                        onTap: () {},
                        icon: Icons.edit_outlined,
                        dimension: Get.width * 0.1,
                        backgroundColor: Get.theme.primaryColor.withOpacity(0.1),
                        iconColor: Get.theme.primaryColor,
                        padding: Utils.lowPadding,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.75,
                    child: ListTile(
                      title: CustomText.high("Middle road Sediago", bold: true),
                      subtitle: CustomText("201, sector 25, Centre Park, New Delhi, India", textColor: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: CustomText.extraHigh('Place Order', textColor: getTextColor, bold: true),
        centerTitle: true,
        isLeadingBlack: true,
      );
}
