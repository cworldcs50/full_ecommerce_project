import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_botton_app_bar_btn.dart';
import '../../../core/constants/app_color.dart';
import '../../../controller/home/home_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key, required this.controller});

  final HomeControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.backgroundColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          ...List.generate(controller.pages.length, (index) {
            return CustomBottomAppBarBtn(
              active: index == controller.currentIndex,
              icon: controller.bottomAppBarBtnsIcons[index],
              title: controller.bottomAppBarBtnsTitle[index].tr,
              onPressed: () => controller.changeToPage((index)),
            );
          }),
        ],
      ),
    );
  }
}
