import '../../../../../core/class/api.dart';
import '../../../../../core/constants/app_api_links.dart';

class ForgetPasswordData {
  const ForgetPasswordData({required this.api});

  final Api api;

  Future<dynamic> checkEmail(String deliveryEmail) async {
    final result = await api.post(AppApiLinks.kDeliveryCheckMail, {
      "deliveryEmail": deliveryEmail,
    });

    return result.fold((l) => l, (r) => r);
  }
}
