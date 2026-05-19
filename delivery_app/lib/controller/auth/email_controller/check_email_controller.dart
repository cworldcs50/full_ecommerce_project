import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  Future<void> goToSuccessCheckEmail();
}

class CheckEmailControllerImp extends CheckEmailController {
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formKey;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      await goToSuccessCheckEmail();
    }
  }

  @override
  Future<void> goToSuccessCheckEmail() async =>
      await Get.offNamed(AppRoutesNames.kSuccessCheckEmail);
}
