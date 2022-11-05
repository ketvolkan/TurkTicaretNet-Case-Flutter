import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/variables/colors.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_icon_button.dart';
import '../../widgets/others/coffee_count_selection.dart';
import '../../widgets/others/custom_appbar.dart';
import '../../widgets/others/custom_scaffold.dart';
import '../../widgets/text/custom_read_more_text.dart';
import '../../widgets/text/custom_text.dart';
import '../../widgets/text/rating_text.dart';
import 'coffee_detail_controller.dart';
import 'widgets/category_icon.dart';
import 'widgets/size_selection.dart';

class CoffeeDetailView extends GetView<CoffeeDetailController> {
  const CoffeeDetailView({Key? key}) : super(key: key);
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
              namePriceRatingSection,
              detailSection,
              categoriesSection,
              SizeSelection(controller: controller),
              addToCardAndCountSection,
            ],
          ),
        ),
      ),
    );
  }

  Row get addToCardAndCountSection {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Obx(
          () => CoffeeCountSelection(
            count: controller.selectedCount,
            incerement: () => controller.countChange(increment: true),
            reduce: () => controller.countChange(),
          ),
        ),
        CustomElevatedButton(
          onTap: controller.addToCardOnTap,
          backgroundColor: buttonColor,
          borderRadius: Utils.normalRadius,
          child: Padding(
              padding: EdgeInsets.all(Utils.highPadding),
              child: CustomText.high("Add To Card", textColor: getReversedTextColor, bold: true)),
        )
      ],
    );
  }

  Padding get categoriesSection {
    return Padding(
      padding: EdgeInsets.only(top: Utils.normalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryIcon(iconSvg: AppConstants.coffeSvg),
          CategoryIcon(iconSvg: AppConstants.milkSvg),
          CategoryIcon(iconSvg: AppConstants.cakeSvg),
        ],
      ),
    );
  }

  Padding get detailSection {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
      child: CustomReadMoreText(text: controller.coffeeModel?.detail ?? ""),
    );
  }

  Padding get namePriceRatingSection {
    return Padding(
      padding: EdgeInsets.all(Utils.normalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.extraHigh(controller.coffeeModel?.name, bold: true),
              CustomText("(₺${controller.coffeeModel?.price})", bold: true),
            ],
          ),
          RatingText(
            rating: controller.coffeeModel?.rating ?? 0,
            color: getTextColor,
            textSize: Utils.extraHighTextSize,
            size: Utils.extraHighTextSize,
          )
        ],
      ),
    );
  }

  SizedBox get imageSection => SizedBox(
        width: Get.width,
        height: Get.height * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Utils.extraHighRadius),
          child: Image.network(controller.coffeeModel?.imageUrl ?? AppConstants.notFoundImage, fit: BoxFit.cover),
        ),
      );
  CustomAppBar get _buildAppBar => CustomAppBar(
        title: CustomText.extraHigh('Details', textColor: getReversedTextColor, bold: true),
        centerTitle: true,
        showLeadingBackIcon: true,
        actions: [favoriteIcon],
      );
  CustomIconButton get favoriteIcon => CustomIconButton(icon: Icons.favorite_outline, onTap: () {});
}
