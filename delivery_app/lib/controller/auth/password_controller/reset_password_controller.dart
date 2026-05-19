import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../../core/constants/enums/input_type.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/functions/validate_input.dart';
import '../../../core/services/services.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/auth/forget_password/reset_password_data.dart';

abstract class ResetPasswordController extends GetxController {
  Future<void> resetPassword();
  Future<void> goToSuccessPassword();
  String? passwordchecker(String? password);
  String? confirmedPasswordChecker(String? confirmedPassword);
}

class ResetPasswordControllerImp extends ResetPasswordController {
  RequestStatus? requestStatus;
  late final GlobalKey<FormState> formKey;
  late final ResetPasswordData resetPasswordData;
  late final TextEditingController passwordController;
  late final TextEditingController confirmedPasswordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    passwordController = TextEditingController();
    confirmedPasswordController = TextEditingController();
    resetPasswordData = ResetPasswordData(api: Get.find<Services>().api);
    super.onInit();
  }

  @override
  Future<void> goToSuccessPassword() async =>
      await Get.offNamed(AppRoutesNames.kSuccessResetPassword);

  @override
  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();

      final result = await resetPasswordData.resetPassword(
        Get.arguments["email"],
        confirmedPasswordController.text,
      );

      requestStatus = handlingData(result);

      if (requestStatus == RequestStatus.success) {
        if (result["status"] == "success") {
          await goToSuccessPassword();
        } else if (result["status"] == "same password") {
          requestStatus = null;
          update();
          await Get.defaultDialog(title: "62".tr, middleText: "72".tr);
        } else {
          requestStatus = null;
          update();
          await Get.defaultDialog(title: "67".tr, middleText: "73".tr);
        }
      } else {
        update();
        await Future.delayed(const Duration(seconds: 5), () {
          requestStatus = null;
          update();
        });
      }
    }
  }

  @override
  String? confirmedPasswordChecker(String? confirmedPassword) {
    if (confirmedPassword == null || confirmedPassword.isEmpty) {
      return "70".tr;
    } else if (passwordController.text != confirmedPasswordController.text) {
      return "58".tr;
    } else {
      return null;
    }
  }

  @override
  String? passwordchecker(String? password) =>
      validateInput(password!, 8, 32, InputType.password)?.tr;
}
