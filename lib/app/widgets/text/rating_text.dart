import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import 'custom_text.dart';

class RatingText extends StatelessWidget {
  final double rating;
  final double? size;
  final int? ratingCount;
  final double? textSize;
  final Color? color;
  const RatingText({super.key, required this.rating, this.ratingCount, this.size, this.color, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.star, color: Colors.orangeAccent, size: size ?? Utils.normalIconSize * 0.8),
        SizedBox(width: Utils.extraLowPadding),
        CustomText.custom(
          "$rating${ratingCount is int ? "/$ratingCount ratings" : ""}",
          textColor: color ?? getReversedTextColor,
          textSize: textSize ?? Utils.lowTextSize,
          bold: true,
        )
      ],
    );
  }
}
