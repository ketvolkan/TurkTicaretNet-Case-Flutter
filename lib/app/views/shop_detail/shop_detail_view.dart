import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/grid_coffee_item.dart';
import 'widgets/product_category_choose.dart';
import '../../widgets/cards/custom_card.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/variables/colors.dart';

import '../../../core/utils/utils.dart';
import '../../widgets/others/custom_appbar.dart';
import '../../widgets/others/custom_scaffold.dart';
import '../../widgets/text/custom_text.dart';
import 'shop_detail_controller.dart';

class ShopDetailView extends GetView<ShopDetailController> {
  const ShopDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSingleChildScrollView: false,
      appBar: _buildAppBar,
      body: Padding(
        padding: EdgeInsets.only(top: Utils.normalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reserveSection,
            SizedBox(height: Utils.normalPadding),
            categoryChoose,
            Padding(padding: EdgeInsets.all(Utils.normalPadding), child: CustomText.extraHigh("Today's Special", bold: true)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Utils.normalPadding,
                  mainAxisSpacing: Utils.normalPadding,
                  childAspectRatio: 0.6,
                ),
                itemCount: controller.shopModel?.coffees?.length,
                itemBuilder: (context, index) {
                  return GridCoffeeItem(coffeeModel: (controller.shopModel?.coffees ?? [])[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx get categoryChoose => Obx(
        () => ProductCategoryChoose(
          categories: const ["Coffee", "Cakes"],
          shopDetailController: controller,
          selectedId: controller.selectedId,
        ),
      );
  InkWell get reserveSection => InkWell(
        onTap: () {},
        child: CustomCard(
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
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(Utils.highRadius)),
                          image: DecorationImage(
                              image: NetworkImage(controller.shopModel?.imageUrl ?? AppConstants.notFoundImage),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: CustomText.high("Reseve a table now", bold: true),
                        subtitle: CustomText(
                          "Lorem ipsum dolor sit amet, cons ectetur adipiscing elit.",
                          textColor: Colors.grey,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: getTextColor),
                    SizedBox(width: Utils.normalPadding),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: CustomText.extraHigh(controller.shopModel?.name),
        centerTitle: true,
        showLeadingBackIcon: true,
        isLeadingBlack: true,
      );
}
