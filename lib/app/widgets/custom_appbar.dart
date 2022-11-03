import '../../core/utils/utils.dart';
import '../../core/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  final bool showLeadingBackIcon;
  final Widget? customLeadingButton;
  final bool centerTitle;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      backgroundColor: Get.theme.backgroundColor,
      title: title,
      leading: showLeadingBackIcon ? leadingIcon() : customLeadingButton,
      actions: actions ?? [drawingButton],
      centerTitle: centerTitle,
      elevation: 0,
    );
  }

  InkWell get drawingButton => InkWell(
        child: Padding(
          padding: EdgeInsets.all(Utils.normalPadding),
          child: Icon(Icons.menu, color: getReversedTextColor, size: Utils.extraHighIconSize),
        ),
        onTap: () {},
      );
  IconButton leadingIcon() {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Get.theme.appBarTheme.titleTextStyle!.color),
      onPressed: onLeadingPressed ??
          () {
            Get.back();
          },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
