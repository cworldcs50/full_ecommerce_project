import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        color: AppColor.primaryColorDark,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}