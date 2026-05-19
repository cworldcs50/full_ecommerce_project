import '../../../../../core/class/api.dart';
import '../../../../../core/constants/app_api_links.dart';

class ForgetPasswordVerificationCodeData {
  const ForgetPasswordVerificationCodeData({required this.api});

  final Api api;

  Future<dynamic> checkCode(
    String deliveryEmail,
    String deliveryVerficationCode,
  ) async {
    final result = await api
        .post(AppApiLinks.kDeliveryForgetPasswordVerificationCode, {
          "deliveryEmail": deliveryEmail,
          "deliveryVerficationCode": deliveryVerficationCode,
        });

    return result.fold((l) => l, (r) => r);
  }
}
