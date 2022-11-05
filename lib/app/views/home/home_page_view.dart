import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../../route/app_routes.dart';
import '../../widgets/fields/custom_search_bar.dart';
import '../../widgets/others/custom_navigation_bar.dart';
import '../../widgets/others/custom_scaffold.dart';
import '../../widgets/text/custom_text.dart';
import 'home_page_controller.dart';
import 'widgets/coffee_list_item.dart';
import 'widgets/shop_list_item.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSingleChildScrollView: false,
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 0),
      body: Padding(
        padding: EdgeInsets.only(top: Utils.normalPadding),
        child: Column(
          children: [
            topSection,
            SizedBox(height: Utils.lowPadding),
            searchBar,
            SizedBox(height: Utils.extraHighPadding),
            popularCoffeeSection,
            SizedBox(height: Utils.lowPadding),
            nearestShopSection,
          ],
        ),
      ),
    );
  }

  Widget get nearestShopSection => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.extraHigh("Nearest coffee shops", bold: true),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.AllShop),
                child: CustomText("View All", textColor: Get.theme.primaryColor, bold: true),
              )
            ],
          ),
          SizedBox(height: Utils.normalPadding),
          SizedBox(
            height: Get.height * 0.22,
            child: Obx(() {
              return controller.shopList.length >= 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShopListItem(shopModel: controller.shopList[0]),
                        ShopListItem(shopModel: controller.shopList[1])
                      ],
                    )
                  : const SizedBox();
            }),
          ),
        ],
      );
  Widget get popularCoffeeSection => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.extraHigh("Popular Coffee", bold: true),
          SizedBox(height: Utils.normalPadding),
          SizedBox(
            height: Get.height * 0.30,
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CoffeeListItem(
                    coffeeModel: controller.coffeeList[index],
                    onTap: () => Get.toNamed(
                          AppRoutes.CoffeeDetail,
                          arguments: {"coffeeModel": controller.coffeeList[index]},
                        )),
                separatorBuilder: (context, index) => SizedBox(width: Utils.normalPadding),
                itemCount: controller.coffeeList.length,
              ),
            ),
          ),
        ],
      );

  Padding get searchBar => Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
        child: CustomSearchBar(
          leadingIcon: Icon(
            Icons.search,
            size: Utils.extraHighIconSize,
          ),
          hintText: "Search anything",
        ),
      );

  Widget get topSection => Padding(
        padding: EdgeInsets.only(left: Utils.normalPadding, right: Utils.normalPadding, top: Utils.extraHighPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText.custom(
                      "Get your ",
                      bold: true,
                      textSize: Get.width * 0.07,
                    ),
                    CustomText.custom(
                      "Coffee",
                      bold: true,
                      textSize: Get.width * 0.07,
                      textColor: Get.theme.primaryColor.withOpacity(0.75),
                    ),
                  ],
                ),
                CustomText.custom(
                  "on one finger tap",
                  bold: true,
                  textSize: Get.width * 0.07,
                ),
              ],
            ),
            CircleAvatar(
                backgroundColor: Get.theme.primaryColor,
                radius: Get.width * 0.075,
                child: CustomText.extraHigh("VK", textColor: getReversedTextColor)),
          ],
        ),
      );
}
