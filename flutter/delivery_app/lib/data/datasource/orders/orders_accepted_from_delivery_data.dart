import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class OrdersAcceptedFromDeliveryData {
  const OrdersAcceptedFromDeliveryData({required this.api});

  final Api api;

  Future<dynamic> getOrders(String userId) async {
    final result = await api.post(AppApiLinks.kDeliveryAssignedToDeliveryView, {
      "deliveryWorkerId": userId,
    });

    return result.fold((l) => l, (r) => r);
  }
}
