import 'package:get/get.dart';
import '../services/services.dart';

final String? lang = Get.find<Services>().prefs.getString("language");

String translateDataBase(String columnEn, String columnAr) =>
    lang == "en" || lang == null ? columnEn : columnAr;
