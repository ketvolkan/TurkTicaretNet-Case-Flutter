import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../variables/colors.dart';
import 'utils.dart';

enum ToastStyle { SUCCESS, ERROR, NORMAL, WARNING }

extension CustomToastExtension on GetInterface {
  Future<bool?> showToast(String text, {ToastStyle? toastStyle = ToastStyle.NORMAL, ToastGravity? toastGravity}) {
    late Color backgroundColor;
    late Color textColor;
    switch (toastStyle) {
      case ToastStyle.SUCCESS:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case ToastStyle.ERROR:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
      case ToastStyle.WARNING:
        backgroundColor = Colors.orange;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = const Color(0xFFD1CDCD);
        textColor = getReversedTextColor;
    }
    return Future.microtask(
      () => Fluttertoast.showToast(
        msg: text,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: Utils.highTextSize,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
      ),
    );
  }
}
