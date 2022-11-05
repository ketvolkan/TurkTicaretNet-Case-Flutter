import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';

class CustomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int)? onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unSelectedItemColor;
  final double notchMargin;

  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.backgroundColor,
    this.selectedItemColor,
    this.unSelectedItemColor,
    this.onTap,
    this.notchMargin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: Get.width * 0.4)],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(Utils.highPadding), bottom: Radius.circular(Utils.extraHighPadding * 2.5)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: notchMargin,
          color: backgroundColor ?? ColorTable.bottomBarBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Utils.highPadding, vertical: Utils.normalPadding),
            child: BottomNavigationBar(
                iconSize: Utils.highIconSize,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: currentIndex,
                selectedItemColor: selectedItemColor ?? ColorTable.bottomBarSelectPage,
                unselectedItemColor: unSelectedItemColor ?? ColorTable.bottomBarUnSelectPage,
                onTap: onTap ??
                    (value) {
                      /*
                    switch (value) {
                          case 0:
                            if (Get.currentRoute != AppRoutes.PROFILE) {
                              Get.offAllNamed(AppRoutes.PROFILE);
                            }
                            break;
                          case 1:
                            if (Get.currentRoute != AppRoutes.HOME) {
                              Get.offAllNamed(AppRoutes.HOME);
                            }
                            break;
                          case 2:
                            if (Get.currentRoute != AppRoutes.SEARCH) {
                              Get.offAllNamed(AppRoutes.SEARCH);
                            }
                            break;
                          case 3:
                            if (Get.currentRoute != AppRoutes.SETTING) {
                              Get.offAllNamed(AppRoutes.SETTING);
                            }
                            break;
                          default:
                            Get.offAllNamed(AppRoutes.HOME);
                        }
                    */
                    },
                items: items),
          ),
        ),
      ),
    );
  }

//Todo iconlar tasarımdan alınacak
  List<BottomNavigationBarItem> get items => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.check_box_outline_blank),
          label: "Order.",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: "Location",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favorite.",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "Profile",
        ),
      ];
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
