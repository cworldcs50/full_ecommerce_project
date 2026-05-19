import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_bottom_app_bar.dart';
import '../../../core/constants/app_color.dart';
import '../../controller/home/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBar(controller: controller),
          body: controller.pages[controller.currentIndex],
        );
      },
    );
  }
}
