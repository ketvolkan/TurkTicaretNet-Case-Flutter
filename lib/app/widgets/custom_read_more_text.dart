import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../core/variables/colors.dart';

class CustomReadMoreText extends StatelessWidget {
  final String text;
  const CustomReadMoreText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLength: 150,
      style: TextStyle(color: getTextColor.withOpacity(0.3), fontWeight: FontWeight.bold, fontFamily: "Poppins"),
      moreStyle: TextStyle(color: Get.theme.primaryColor, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
      lessStyle: TextStyle(color: Get.theme.primaryColor, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
    );
  }
}
