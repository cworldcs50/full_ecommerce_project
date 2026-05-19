import '../app_binding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import '../core/localization/app_langs_translations.dart';
import '../core/localization/change_locale_controller.dart';

class DeliveryApp extends StatelessWidget {
  DeliveryApp({super.key});

  final ChangeLocaleController changeLocaleController =
      Get.put<ChangeLocaleController>(ChangeLocaleController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appPages,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      translations: AppLangsTranslations(),
      theme: changeLocaleController.appTheme,
      locale: changeLocaleController.language,
    );
  }
}
