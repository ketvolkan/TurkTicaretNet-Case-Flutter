import 'package:flutter/material.dart';

import '../../../core/variables/colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Function()? onTap;
  const CustomIconButton({super.key, required this.icon, this.onTap, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: CircleAvatar(
            backgroundColor: getReversedTextColor.withOpacity(0.3), child: Icon(icon, color: getReversedTextColor, size: size)),
        onPressed: onTap);
  }
}
