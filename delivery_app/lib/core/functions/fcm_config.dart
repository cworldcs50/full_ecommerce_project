import 'dart:developer';

import 'package:get/get.dart';
import '../../controller/home/pending_orders_controller.dart';
import '../constants/app_routes_names.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void fcmMessaging() {
  FirebaseMessaging.onMessage.listen((remoteMessage) async {
    log("======================= Notification =======================");
    log(
      " ======================= Title: ${remoteMessage.notification!.title!} =======================",
    );
    log(
      " ======================= body: ${remoteMessage.notification!.body!} =======================",
    );

    log(Get.currentRoute);

    await FlutterRingtonePlayer().playNotification();

    Get.snackbar(
      remoteMessage.notification!.title!,
      remoteMessage.notification!.body!,
      snackPosition: SnackPosition.TOP,
    );

    if (remoteMessage.data["pageId"] == "deliveryHome" &&
        Get.currentRoute == AppRoutesNames.kHome) {
      Get.find<PendingOrdersController>().refreshDeliveryHomePage();
    }
  });
}
