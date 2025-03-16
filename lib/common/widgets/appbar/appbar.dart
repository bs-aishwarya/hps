import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hps/utils/constants/colors.dart';
import 'package:hps/utils/constants/sizes.dart';
import 'package:hps/utils/device/device_utility.dart';
import 'package:hps/utils/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  const appBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    required this.actions,
    this.leadingOnPressed,
    this.padding,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget> actions;
  final VoidCallback? leadingOnPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final bool dark = MyAppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: MyAppSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:
            showBackArrow
                ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Iconsax.arrow_left,
                    color: dark ? MyAppColors.textWhite : MyAppColors.black,
                  ),
                )
                : leadingIcon != null
                ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MyAppDeviceUtils.getAppBarHeight());
}
