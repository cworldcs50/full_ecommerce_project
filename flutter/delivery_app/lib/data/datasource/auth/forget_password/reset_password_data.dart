import '../../../../../core/class/api.dart';
import '../../../../../core/constants/app_api_links.dart';

class ResetPasswordData {
  const ResetPasswordData({required this.api});

  final Api api;

  Future<dynamic> resetPassword(String deliveryEmail, String password) async {
    final result = await api.post(AppApiLinks.kDeliveryResetPassword, {
      "deliveryEmail": deliveryEmail,
      "deliveryNewPassword": password,
    });

    return result.fold((l) => l, (r) => r);
  }
}
