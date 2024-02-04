import 'package:base_project_getx/core/constants/colors.dart';
import 'package:base_project_getx/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;

  const CustomAppBar(
      {Key? key, required this.title, this.isBackButtonExist = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppStyles.h3,
      ),
      centerTitle: true,
      leading: isBackButtonExist
          ? GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios,
                  color: ColorResources.blackColor))
          : const SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}
