import 'package:flutter/material.dart';
import 'package:turkticaretnetcase/core/variables/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final BorderSide? borderSide;
  final double? borderRadius;
  final Function() onTap;
  const CustomElevatedButton(
      {super.key, this.backgroundColor, this.child, this.borderSide, this.borderRadius, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => backgroundColor ?? getTextColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0), side: borderSide ?? BorderSide.none)),
            shadowColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
        child: child);
  }
}
