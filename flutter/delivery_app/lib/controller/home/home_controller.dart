import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import '../../view/home/home.dart';
// import '../../core/services/services.dart';
import '../../view/home/home_body.dart';
import '../../view/orders/orders_assigned_to_delivery.dart';
// import '../../view/orders/orders_assigned_to_delivery.dart';
import '../../view/settings/settings.dart';
// import '../../core/services/firebase_messaging.dart';
// import '../../core/constants/enums/request_status.dart';
// import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeController extends GetxController {
  // Future<void> initialData();
  void changeToPage(int pageIndex);
}

class HomeControllerImp extends HomeController {
  late final int id;
  int currentIndex = 0;
  late final String username;
  final List<IconData> bottomAppBarBtnsIcons = [
    Icons.home,
    // Icons.delivery_dining,
    Icons.add_shopping_cart,
    Icons.settings,
  ];
  final List<Widget> pages = const [
    HomeBody(),
    // OrdersAssignedToDelivery(),
    OrdersAssignedToDelivery(),
    Settings(),
  ];
  // final SharedPreferences sharedPrefs = Get.find<Services>().prefs;
  final List<String> bottomAppBarBtnsTitle = const ["80", "78", "78"];

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   // await initialData();
  // }

  // @override
  // Future<void> initialData() async {
  //   // orders = [];
  //   // username = sharedPrefs.getString("user_name")!;
  //   // id = sharedPrefs.getInt("user_id")!;
  //   // await FirebaseMessagingService().fcmInstance.subscribeToTopic("users$id");
  // }

  @override
  void changeToPage(int pageIndex) {
    currentIndex = pageIndex;
    update();
  }
}
