import '../../../core/class/api.dart';
import '../../../core/constants/app_api_links.dart';

class OrdersArchieveData {
  const OrdersArchieveData({required this.api});

  final Api api;

  Future<dynamic> getCompletedOrders(String deliveryWorkerId) async {
    final result = await api.post(AppApiLinks.kDeliveryOrdersArchieve, {
      "deliveryWorkerId": deliveryWorkerId,
    });

    return result.fold((l) => l, (r) => r);
  }
}