import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/services/services.dart';

class CustomOfferContainer extends StatelessWidget {
  const CustomOfferContainer({
    required this.subTitle,
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title, subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 380,
        height: 190,
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF5673C4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Positioned(
              top: -25,
              right:
                  Get.find<Services>().prefs.getString("language") == "en"
                      ? -20
                      : 220,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColorLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
