import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final BorderSide borderSide;
  final Color? backgroundColor;
  final bool isPaddingZero;
  final double? padding;
  const CustomCard(
      {super.key,
      required this.child,
      this.borderSide = BorderSide.none,
      this.backgroundColor,
      this.isPaddingZero = false,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? getReversedTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Utils.extraHighRadius), side: borderSide),
      elevation: 0,
      child: Padding(
        padding: isPaddingZero ? EdgeInsets.zero : EdgeInsets.all(padding ?? Utils.normalPadding),
        child: child,
      ),
    );
  }
}
