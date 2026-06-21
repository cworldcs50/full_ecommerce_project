import 'package:get/get.dart';
import 'controller/home/home_controller.dart';
import 'controller/settings/settings_controller.dart';
import 'controller/home/pending_orders_controller.dart';
import 'controller/orders/orders_details_controller.dart';
import 'controller/orders/orders_archieve_controller.dart';
import 'controller/auth/authentication/login_controller.dart';
import 'controller/auth/email_controller/check_email_controller.dart';
import 'controller/orders/orders_assigned_to_delivery_controller.dart';
import 'controller/auth/password_controller/reset_password_controller.dart';
import 'controller/auth/password_controller/forget_password_controller.dart';
import 'controller/auth/email_controller/success_check_email_controller.dart';
import 'controller/auth/password_controller/hide_or_show_password_controller.dart';
import 'controller/auth/password_controller/success_reset_password_controller.dart';
import 'controller/auth/verification_code/forget_password_verify_code_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginControllerImp>(() => LoginControllerImp(), fenix: true);

    Get.lazyPut<CheckEmailControllerImp>(
      () => CheckEmailControllerImp(),
      fenix: true,
    );

    Get.lazyPut<SuccessCheckEmailControllerImp>(
      () => SuccessCheckEmailControllerImp(),
      fenix: true,
    );

    Get.lazyPut<ForgetPasswordControllerImp>(
      () => ForgetPasswordControllerImp(),
      fenix: true,
    );

    Get.lazyPut<ResetPasswordControllerImp>(
      () => ResetPasswordControllerImp(),
      fenix: true,
    );

    Get.lazyPut<SuccessResetPasswordControllerImp>(
      () => SuccessResetPasswordControllerImp(),
      fenix: true,
    );

    Get.lazyPut<ForgetPasswordVerifyCodeControllerImp>(
      () => ForgetPasswordVerifyCodeControllerImp(),
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "password",
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "confirmedPassword",
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "signUpPassword",
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "login",
      fenix: true,
    );

    Get.lazyPut<HomeControllerImp>(() => HomeControllerImp(), fenix: true);

    Get.lazyPut<SettingsControllerImp>(
      () => SettingsControllerImp(),
      fenix: true,
    );

    Get.lazyPut<OrdersAssignedToDeliveryController>(
      () => OrdersAssignedToDeliveryController(),
      fenix: true,
    );

    Get.lazyPut<PendingOrdersController>(
      () => PendingOrdersController(),
      fenix: true,
    );

    Get.lazyPut(() => OrdersDetailsController(), fenix: true);
    Get.lazyPut(() => OrdersArchieveController(), fenix: true);
  }
}
