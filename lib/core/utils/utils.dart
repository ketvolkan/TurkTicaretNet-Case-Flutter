import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static double get extraLowTextSize => Get.height * 0.012;
  static double get lowTextSize => Get.height * 0.015;
  static double get normalTextSize => Get.height * 0.018;
  static double get highTextSize => Get.height * 0.022;
  static double get extraHighTextSize => Get.height * 0.025;

  static double get extraLowPadding => Get.height * 0.005;
  static double get lowPadding => Get.height * 0.01;
  static double get normalPadding => Get.height * 0.015;
  static double get highPadding => Get.height * 0.02;
  static double get extraHighPadding => Get.height * 0.025;

  //Radius
  static double get extraLowRadius => Get.height * 0.01;
  static double get lowRadius => Get.height * 0.015;
  static double get normalRadius => Get.height * 0.02;
  static double get highRadius => Get.height * 0.025;
  static double get extraHighRadius => Get.height * 0.035;

  //Icons
  static double get extraLowIconSize => Get.height * 0.015;
  static double get lowIconSize => Get.height * 0.02;
  static double get normalIconSize => Get.height * 0.025;
  static double get highIconSize => Get.height * 0.033;
  static double get extraHighIconSize => Get.height * 0.04;

  static double get appBarHeight => Get.height * 0.07;

  static RegExp get regExpDouble => RegExp(r'^([0-9]+([.][0-9]*)?|[.][0-9]+)$');
  static RegExp get regExpDoubleLT100 => RegExp(
      r'^([0-9]\.|[0-9]\.[0-9]{1}|[0-9]\.[0-9]{2}|[1-9][0-9]\.|[1-9][0-9]\.[0-9]{1}|[1-9][0-9]\.[0-9]{2}|[0-9][0-9]|[1-9][0-9]\.[0-9]{2})$|^([0-9]|[0-9][0-9]|[0-99])$|^100$'); //Lower than equal 100
  static RegExp get regExpIntLTE100 => RegExp(r'^(?:100|\d\d?)$'); //Lower than equal 100
  static RegExp get regExpIntGT0 => RegExp(r'^[1-9]*[1-9][0-9]*$');
  static RegExp get regExStringsWithOnlyVowels => RegExp(r"[aeiou]+");
}

extension CustomDoubleExtensions on double {
  double get getDynamicSizeWidth => Get.width * this;
  double get getDynamicSizeHeight => Get.height * this;
}

extension CustomIntegerExtensions on int {
  double get getDynamicSizeWidth => Get.width * this;
  double get getDynamicSizeHeight => Get.height * this;
}

extension CustomStringExtensions on String {
  Color toColor() {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Color? toColorNullable() {
    try {
      final hexCode = replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    } catch (_) {
      return null;
    }
  }

  String get replaceTurkishChars {
    var replaced = toLowerCase();
    replaced = replaced.replaceAll('ş', 's');
    replaced = replaced.replaceAll('ı', 'i');
    replaced = replaced.replaceAll('ğ', 'g');
    replaced = replaced.replaceAll('ç', 'c');
    replaced = replaced.replaceAll('ö', 'o');
    replaced = replaced.replaceAll('ü', 'u');
    return replaced;
  }

  String lastChars(int n) {
    if (length < n) return "";
    return substring(length - n);
  }
}
