import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/core/themes/colors.dart';
import '../controllers/root_page_controller.dart';

class RootPageView extends GetView<RootPageController> {
  const RootPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(
        init: RootPageController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AnimatedBottomBar(
              currentIcon: controller.selectedIndex,
              onTap: (int index) => controller.onItemTapped(index),
              icons: controller.icons,
            ),
            body: controller.pages.elementAt(controller.selectedIndex),
            extendBody: true,
          );
        });
  }
}

class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<IconModel> icons;
  final ValueChanged<int>? onTap;

  const AnimatedBottomBar({
    Key? key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 76,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons
              .map(
                (icon) => GestureDetector(
                  onTap: () {
                    onTap?.call(icon.id);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        icon.icon,
                        height: currentIcon == icon.id ? 26 : icon.size,
                        width: currentIcon == icon.id ? 26 : icon.size,
                        color: currentIcon == icon.id ? AppColors.primary : AppColors.inactiveIconColor,
                      ),
                      Text(
                        icon.label,
                        style: TextStyle(
                          fontSize: 12,
                          color: currentIcon == icon.id ? AppColors.primary : AppColors.inactiveIconColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
