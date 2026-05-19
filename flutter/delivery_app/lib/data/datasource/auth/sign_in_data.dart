import 'package:dartz/dartz.dart';
import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';
import '../../../../core/constants/enums/request_status.dart';

class SignInData {
  const SignInData({required this.api});

  final Api api;

  Future<dynamic> deliverySignIn(String email, String password) async {
    final Either<RequestStatus, Map<dynamic, dynamic>> result = await api.post(
      AppApiLinks.kDeliverySignIn,
      {"deliveryEmail": email, "deliveryPassword": password},
    );

    return result.fold((l) => l, (r) => r);
  }
}
