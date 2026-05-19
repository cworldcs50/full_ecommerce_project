import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/services.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/auth/sign_in_data.dart';
import '../../../data/models/delivery_model.dart';

abstract class LoginController extends GetxController {
  Future<void> login();
  Future<void> goToSignUp();
  Future<void> goToHomeView();
  Future<void> goToForgetPassword();
  Future<void> goToVerifyCodeSignIn();
  String? validateInputs(String? password);
}

class LoginControllerImp extends LoginController {
  RequestStatus? requestStatus;
  late final SignInData signInData;
  late final GlobalKey<FormState> formKey;
  late final SharedPreferences sharedPrefs;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    sharedPrefs = Get.find<Services>().prefs;
    signInData = SignInData(api: Get.find<Services>().api);
    super.onInit();
  }

  @override
  Future<void> login() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();

      final dynamic result = await signInData.deliverySignIn(
        emailController.text,
        passwordController.text,
      );

      requestStatus = handlingData(result);

      if (requestStatus == RequestStatus.success) {
        if (result['status'] == 'success') {
          await DeliveryModel.fromJson(result["data"]).toSharedPrefs();

          if (result["data"]["users_approve"] == 1) {
            await sharedPrefs.setBool("isUserSignedIn", true);
            requestStatus = null;
            await goToHomeView();
            update();
          } else {
            requestStatus = null;
            await goToVerifyCodeSignIn();
            update();
          }
        } else {
          requestStatus = null;
          update();
          await Get.defaultDialog(title: "67".tr, middleText: "69".tr);
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
  Future<void> goToSignUp() async => await Get.offNamed(AppRoutesNames.kSignUp);

  @override
  Future<void> goToForgetPassword() async =>
      await Get.toNamed(AppRoutesNames.kForgetPassword);

  @override
  Future<void> goToHomeView() async =>
      await Get.offAllNamed(AppRoutesNames.kHome);

  @override
  Future<void> goToVerifyCodeSignIn() async => await Get.offNamed(
    AppRoutesNames.kVerifyCodeSignUp,
    arguments: {"email": emailController.text.trim()},
  );

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  String? validateInputs(String? password) =>
      password != null && password.isNotEmpty ? null : "70";
}
