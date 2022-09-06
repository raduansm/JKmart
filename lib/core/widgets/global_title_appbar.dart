import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jkmart/core/utils/colors.dart';

class GlobalTitleAppBar extends StatelessWidget with PreferredSizeWidget {
  const GlobalTitleAppBar({
    Key? key,
    required this.titleText,
    this.bottom,
  }) : super(key: key);

  final String titleText;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return GFAppBar(
      backgroundColor: CustomColor.grey,
      elevation: 0,
      leading: IconButton(
        iconSize: 20,
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
        color: Colors.black,
      ),
      centerTitle: true,
      title: Text(titleText, style: Get.textTheme.headline5),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 100 : 55);
}
