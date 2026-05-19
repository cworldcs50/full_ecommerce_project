import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_image_assets.dart';

class CustomSettingsTitle extends StatelessWidget {
  const CustomSettingsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(height: Get.height / 5, color: AppColor.primaryColorDark),
        Positioned(
          bottom: -40,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage(AppImageAssets.avatar),
            ),
          ),
        ),
      ],
    );
  }
}
