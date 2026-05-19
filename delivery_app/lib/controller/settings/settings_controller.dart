import 'package:get/get.dart';
// import '../../core/services/services.dart';
// import '../../core/constants/app_routes_names.dart';
// import '../../core/services/firebase_messaging.dart';
// import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsController extends GetxController {
  Future<void> logout();
  // Future<void> notificationController(bool enableNotification);
}

class SettingsControllerImp extends SettingsController {
  // late bool notificationControllerValue;
  // late final SharedPreferences appSharedPrefs;

  @override
  void onInit() {
    // appSharedPrefs = Get.find<Services>().prefs;
    // notificationControllerValue =
    //     appSharedPrefs.getBool("enable_notification_value") ??
    //     Get.find<Services>().prefs.getBool("user_notification_status")!;
    super.onInit();
  }

  @override
  Future<void> logout() async {
    // await appSharedPrefs.setBool("isUserSignedIn", false);
    // await Get.offAllNamed(AppRoutesNames.kLogin);
    // await FirebaseMessagingService().fcmInstance.unsubscribeFromTopic("users");
    // if (appSharedPrefs.getInt("user_id") != null) {
    //   await FirebaseMessagingService().fcmInstance.unsubscribeFromTopic(
    //     "users${appSharedPrefs.getInt("user_id")}",
    //   );
    // }
  }

  // @override
  // Future<void> notificationController(bool enableNotification) async {
  //   notificationControllerValue = enableNotification;
  //   update();

  //   switch (enableNotification) {
  //     case true:
  //       await FirebaseMessagingService().fcmInstance.subscribeToTopic("users");
  //       break;
  //     case false:
  //       await FirebaseMessagingService().fcmInstance.unsubscribeFromTopic(
  //         "users",
  //       );
  //       break;
  //   }

  //   await appSharedPrefs.setBool(
  //     "notificationControllerValue",
  //     notificationControllerValue,
  //   );
  //   await appSharedPrefs.setBool(
  //     "enable_notification_value",
  //     notificationControllerValue,
  //   );
  // }
}
