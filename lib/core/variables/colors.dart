import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class ColorTable {
  static const backgroundColor = Colors.white;
  static const bottomBarSelectPage = Colors.black;
  static const bottomBarUnSelectPage = Colors.grey;
  static const bottomBarBackgroundColor = Colors.white;
}

// Common
Color primaryColor = Colors.orange;
Color errorColor = Colors.red[400]!;
Color buttonColor = const Color.fromARGB(255, 246, 246, 246);
Color errorColorLight = const Color.fromRGBO(254, 221, 229, 1);
Color successColorLight = const Color.fromRGBO(213, 251, 224, 1);
Color successColor = const Color.fromARGB(255, 22, 148, 58);
Color buttonBackgroundColor = "9747FF".toColor();
Color buttonBackgroundReversedColor = "FFFFFF".toColor();
Color buttonShadowColor = Colors.black;
Color cardBackgroundColor = Colors.white;
const mainAnimationDuration = Duration(milliseconds: 200);
const mainDuration = Duration(milliseconds: 250);

Color get getTextColor => Get.isDarkMode ? Colors.white : Colors.black;
Color get getReversedTextColor => Get.isDarkMode ? Colors.black : Colors.white;
