import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class OrdersDetailsData {
  const OrdersDetailsData({required this.api});

  final Api api;

  Future<dynamic> getOrdersDetails(String orderId) async {
    final result = await api.post(AppApiLinks.kDeliveryOrderDetailsView, {
      "orderId": orderId,
    });

    return result.fold((l) => l, (r) => r);
  }
}
