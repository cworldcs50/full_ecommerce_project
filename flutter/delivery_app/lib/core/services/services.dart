import '../class/api.dart';
import 'package:get/get.dart';
import 'firebase_messaging.dart';
import '../../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late final SharedPreferences prefs;
  late final Api api;

  Future<Services> init() async {
    prefs = await SharedPreferences.getInstance();
    api = Api();
    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => Services().init());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessagingService().initFcm();
}
