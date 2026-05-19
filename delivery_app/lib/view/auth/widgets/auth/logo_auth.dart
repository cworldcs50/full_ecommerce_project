import 'package:flutter/material.dart';
import '../../../../core/constants/app_image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAssets.logo, height: 200);
  }
}
