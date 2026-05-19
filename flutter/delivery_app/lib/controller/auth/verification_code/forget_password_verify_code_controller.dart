import 'package:get/get.dart';
import '../../../core/services/services.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/auth/forget_password/forget_password_verification_code_data.dart';

abstract class ForgetPasswordVerifyCodeController extends GetxController {
  Future<void> goToResetPassword();
  Future<void> checkCode(String verificationCode);
}

class ForgetPasswordVerifyCodeControllerImp
    extends ForgetPasswordVerifyCodeController {
  RequestStatus? requestStatus;
  late final ForgetPasswordVerificationCodeData
  forgetPasswordVerificationCodeData;

  @override
  void onInit() {
    forgetPasswordVerificationCodeData = ForgetPasswordVerificationCodeData(
      api: Get.find<Services>().api,
    );
    super.onInit();
  }

  @override
  Future<void> checkCode(String verificationCode) async {
    requestStatus = RequestStatus.loading;
    update();

    final result = await forgetPasswordVerificationCodeData.checkCode(
      Get.arguments["email"],
      verificationCode,
    );

    requestStatus = handlingData(result);

    if (requestStatus == RequestStatus.success) {
      if (result["status"] == "success") {
        await goToResetPassword();
      } else {
        requestStatus = null;
        update();
        await Get.defaultDialog(title: "67".tr, middleText: "66".tr);
      }
    } else {
      update();
      await Future.delayed(const Duration(seconds: 5), () {
        requestStatus = null;
        update();
      });
    }
  }

  @override
  goToResetPassword() async => await Get.offNamed(
    AppRoutesNames.kResetPassword,
    arguments: {"email": Get.arguments["email"]},
  );
}
