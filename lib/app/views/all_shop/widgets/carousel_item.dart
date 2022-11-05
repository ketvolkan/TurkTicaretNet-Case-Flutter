import 'package:flutter/material.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../../core/variables/colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/shop_model.dart';
import '../../../../core/utils/utils.dart';

class CarouselItem extends StatelessWidget {
  final ShopModel shopModel;
  final bool isSelected;
  final bool isLast;
  final String lastText;
  const CarouselItem(
      {super.key, required this.shopModel, required this.isSelected, required this.isLast, required this.lastText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isSelected ? Utils.extraLowPadding : Utils.lowPadding * 1.2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Utils.lowRadius),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                shopModel.imageUrl ?? AppConstants.notFoundImage,
                fit: BoxFit.cover,
              ),
            ),
            if (isLast)
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                child: Center(
                  child: FittedBox(
                    child: CustomText(lastText, textColor: getReversedTextColor),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
