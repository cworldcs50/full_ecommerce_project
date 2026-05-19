import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/services/services.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/auth/forget_password/forget_password_data.dart';

abstract class ForgetPasswordController extends GetxController {
  String? vaildateEmail();
  Future<void> checkEmail();
  Future<void> goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  RequestStatus? requestStatus;
  late final GlobalKey<FormState> formKey;
  late final ForgetPasswordData forgetPasswordData;
  late final TextEditingController emailController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    forgetPasswordData = ForgetPasswordData(api: Get.find<Services>().api);
    super.onInit();
  }

  @override
  Future<void> checkEmail() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();

      final result = await forgetPasswordData.checkEmail(emailController.text);
      requestStatus = handlingData(result);

      if (requestStatus == RequestStatus.success) {
        if (result["status"] == "success") {
          await goToVerifyCode();
        } else {
          requestStatus = null;
          update();
          await Get.defaultDialog(title: "67".tr, middleText: "71".tr);
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
  goToVerifyCode() async => await Get.offNamed(
    AppRoutesNames.kForgetPasswordVerifyCode,
    arguments: {"email": emailController.text},
  );

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  @override
  String? vaildateEmail() => emailController.text.isNotEmpty ? null : "70";
}
