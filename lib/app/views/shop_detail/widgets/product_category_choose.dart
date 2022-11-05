import 'package:flutter/material.dart';
import '../shop_detail_controller.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../../core/utils/utils.dart';

class ProductCategoryChoose extends StatelessWidget {
  final List<String> categories;
  final int? selectedId;
  final ShopDetailController? shopDetailController;
  const ProductCategoryChoose({super.key, required this.categories, this.shopDetailController, this.selectedId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              for (int i = 0; i < categories.length; i++) categoryButton(categories[i], i == selectedId, i),
            ],
          ),
        ),
        menuIcon
      ],
    );
  }

  InkWell get menuIcon => InkWell(
        child: const Icon(Icons.menu, color: Colors.grey),
        onTap: () {},
      );

  Padding categoryButton(String text, bool isSelected, int index) {
    return Padding(
      padding: EdgeInsets.only(left: Utils.extraHighPadding),
      child: InkWell(
        onTap: () => shopDetailController?.selectedId = index,
        child: Column(
          children: [
            CustomText.extraHigh(
              text,
              textColor: isSelected ? Colors.black : Colors.grey,
              bold: isSelected,
              centerText: true,
            ),
            if (isSelected) const Icon(Icons.arrow_drop_up_rounded),
          ],
        ),
      ),
    );
  }
}
