import 'package:get/get.dart';
import '../services/services.dart';
import '../constants/app_theme.dart';
import 'package:flutter/material.dart';

class ChangeLocaleController extends GetxController {
  Locale? language;
  ThemeData? appTheme;
  Services services = Get.find<Services>();

  @override
  void onInit() {
    final String? sharedPrefLang = services.prefs.getString("language");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = AppTheme.arabicTheme;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = AppTheme.englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme =
          Get.deviceLocale!.languageCode == "en"
              ? AppTheme.englishTheme
              : AppTheme.arabicTheme;
    }
    Get.changeTheme(appTheme!);
    super.onInit();
  }

  Future<void> changeLang(String langCode) async {
    final Locale locale = Locale(langCode);
    services.prefs.setString("language", langCode);
    await Get.updateLocale(locale);
    Get.changeTheme(
      langCode == "en" ? AppTheme.englishTheme : AppTheme.arabicTheme,
    );
  }
}
