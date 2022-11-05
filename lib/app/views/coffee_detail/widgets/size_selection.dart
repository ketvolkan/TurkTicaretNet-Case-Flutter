import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/text/custom_text.dart';
import '../coffee_detail_controller.dart';

class SizeSelection extends StatelessWidget {
  final CoffeeDetailController controller;

  const SizeSelection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<String> chooseList = controller.coffeeModel?.chooseList ?? [];
    return Padding(
      padding: EdgeInsets.all(Utils.normalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.high("Choose Size", bold: true),
          SizedBox(height: Utils.normalPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < chooseList.length; i++) Expanded(child: selectionButton(text: chooseList[i], id: i)),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectionButton({required String text, id}) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
        child: CustomElevatedButton(
          onTap: () {
            controller.changeSelectedSize(id);
          },
          borderRadius: Utils.lowRadius,
          borderSide: BorderSide(color: buttonColor, width: 2),
          backgroundColor: (controller.selectedSize ?? -1) != id ? getReversedTextColor : buttonColor,
          child: FittedBox(
            child: CustomText(
              text,
              textColor: (controller.selectedSize ?? -1) == id ? getReversedTextColor : buttonColor,
              bold: true,
            ),
          ),
        ),
      ),
    );
  }
}
