import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../services/services.dart';
import '../../constants/app_routes_names.dart';

class OnBoardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isVisited = Get.find<Services>().prefs.getBool("visited") ?? false;

    if (isVisited) {
      return const RouteSettings(name: AppRoutesNames.kLogin);
    }
    return null;
  }
}
