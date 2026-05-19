import 'dart:developer';
import '../functions/fcm_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  factory FirebaseMessagingService() => _firebaseMessagingServiceInstance;
  const FirebaseMessagingService._();

  static const _firebaseMessagingServiceInstance = FirebaseMessagingService._();
  FirebaseMessaging get fcmInstance => FirebaseMessaging.instance;

  Future<void> initFcm() async {
    final result = await fcmInstance.requestPermission();

    fcmMessaging();

    if (result.authorizationStatus == AuthorizationStatus.authorized ||
        result.authorizationStatus == AuthorizationStatus.notDetermined ||
        result.authorizationStatus == AuthorizationStatus.provisional) {
    } else {
      await initFcm();
    }

    String? token = await fcmInstance.getToken();
    await fcmInstance.subscribeToTopic("delivery");
    log("token: $token");
  }
}
