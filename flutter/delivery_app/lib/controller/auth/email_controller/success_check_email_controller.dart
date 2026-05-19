import 'package:get/get.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class SuccessCheckEmailController extends GetxController {
  Future<void> goToSignIn();
}

class SuccessCheckEmailControllerImp extends SuccessCheckEmailController {
  @override
  Future<void> goToSignIn() async =>
      await Get.offAllNamed(AppRoutesNames.kLogin);
}
