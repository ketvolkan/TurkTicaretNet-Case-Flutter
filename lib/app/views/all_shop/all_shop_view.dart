import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkticaretnetcase/app/route/app_routes.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/others/custom_appbar.dart';
import '../../widgets/others/custom_scaffold.dart';
import '../../widgets/text/custom_read_more_text.dart';
import '../../widgets/text/custom_text.dart';
import '../../widgets/text/rating_text.dart';
import 'all_shop_controller.dart';
import 'widgets/carousel_item.dart';

class AllShopView extends GetView<AllShopController> {
  const AllShopView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSingleChildScrollView: false,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: Utils.extraHighPadding * 1.6),
          child: Column(
            children: [
              imageSection,
              nameAndRatingSection,
              detailSection,
              SizedBox(height: Get.height * 0.23, child: Center(child: CustomText.extraHigh("Harita Eklenecek", bold: true))),
              viewProductButton,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get viewProductButton => SizedBox(
        width: Get.width,
        child: CustomElevatedButton(
          onTap: () => Get.toNamed(AppRoutes.ShopDetail, arguments: {'shopModel': controller.shopList[controller.selectedId]}),
          backgroundColor: buttonColor,
          borderRadius: Utils.highRadius,
          child: Padding(
            padding: EdgeInsets.all(Utils.extraHighPadding),
            child: CustomText.high("View Products", bold: true, textColor: getReversedTextColor),
          ),
        ),
      );

  Obx get detailSection => Obx(
        () {
          return controller.shopList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.all(Utils.normalPadding),
                  child: SizedBox(
                    width: Get.width,
                    child: CustomReadMoreText(text: controller.shopList[controller.selectedId].detail ?? ""),
                  ),
                )
              : const SizedBox();
        },
      );

  Obx get nameAndRatingSection => Obx(() {
        return controller.shopList.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.5,
                    child: ListTile(
                      title: CustomText.high(controller.shopList[controller.selectedId].name, bold: true),
                      subtitle: CustomText.low(
                        controller.shopList[controller.selectedId].slogan,
                        bold: true,
                        textColor: Colors.grey,
                      ),
                    ),
                  ),
                  RatingText(
                    rating: controller.shopList[controller.selectedId].rating ?? 0,
                    ratingCount: controller.shopList[controller.selectedId].ratingCount,
                    size: Utils.highIconSize,
                    color: Colors.grey,
                  ),
                ],
              )
            : const SizedBox();
      });

  SizedBox get imageSection => SizedBox(
        width: Get.width,
        height: Get.height * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Utils.extraHighRadius),
          child: Obx(
            () => Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: double.infinity,
                  child: Image.network(
                      controller.shopList.isNotEmpty
                          ? controller.shopList[controller.selectedId].imageUrl ?? AppConstants.notFoundImage
                          : AppConstants.notFoundImage,
                      fit: BoxFit.cover),
                ),
                controller.shopList.isNotEmpty ? carouselSection : const SizedBox(),
              ],
            ),
          ),
        ),
      );

  Positioned get carouselSection => Positioned(
        bottom: Utils.normalPadding,
        left: Get.width * 0.1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Utils.highRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SizedBox(
              height: Get.height * 0.1,
              width: Get.width * 0.75,
              child: CarouselSlider.builder(
                itemCount: controller.shopList.length,
                itemBuilder: (context, index, realIndex) {
                  return CarouselItem(
                    shopModel: controller.shopList[index],
                    isSelected: controller.selectedId == index,
                    isLast: (controller.selectedId + 3) == index,
                    lastText: "+${controller.shopList.length - controller.selectedId}",
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) => controller.selectedId = index,
                  disableCenter: true,
                  viewportFraction: 0.26,
                  reverse: false,
                  padEnds: false,
                ),
              ),
            ),
          ),
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: CustomText.extraHigh('Nearby Shops', bold: true, textColor: getReversedTextColor),
        centerTitle: true,
        showLeadingBackIcon: true,
      );
}
