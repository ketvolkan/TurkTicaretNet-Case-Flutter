import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../buttons/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  final bool showLeadingBackIcon;
  final Widget? customLeadingButton;
  final bool centerTitle;
  final bool isLeadingBlack;
  final Function()? onLeadingPressed;
  final bool? automaticallyImplyLeading;

  const CustomAppBar({
    Key? key,
    this.actions,
    this.title,
    this.showLeadingBackIcon = true,
    this.centerTitle = false,
    this.onLeadingPressed,
    this.customLeadingButton,
    this.automaticallyImplyLeading,
    this.isLeadingBlack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        backgroundColor: Colors.transparent,
        title: title,
        leading: showLeadingBackIcon ? leadingIcon() : customLeadingButton,
        actions: actions,
        centerTitle: centerTitle,
        elevation: 0,
      ),
    );
  }

  Widget leadingIcon() {
    return isLeadingBlack
        ? IconButton(
            onPressed: onLeadingPressed ??
                () {
                  Get.back();
                },
            icon: Icon(
              Icons.arrow_back,
              color: getTextColor,
            ))
        : CustomIconButton(
            icon: Icons.arrow_back,
            size: Utils.highIconSize,
            onTap: onLeadingPressed ??
                () {
                  Get.back();
                },
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
