import 'package:get/get.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class SuccessResetPasswordController extends GetxController {
  Future<void> goToSignIn();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  Future<void> goToSignIn() async =>
      await Get.offAllNamed(AppRoutesNames.kLogin);
}
