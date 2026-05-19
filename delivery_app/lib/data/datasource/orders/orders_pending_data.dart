import '../../../core/class/api.dart';
import '../../../core/constants/app_api_links.dart';

class OrdersPendingData {
  const OrdersPendingData({required this.crud});

  final Api crud;

  Future<dynamic> getData() async {
    final result = await crud.post(AppApiLinks.kDeliveryOrdersView, {});

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> approveOrder({
    required String userRequestOrderId,
    required String orderId,
    required String deliveryWorkerId,
    required String orderDeliveryType,
  }) async {
    final result = await crud.post(AppApiLinks.kDeliveryOrdersApprove, {
      "userId": userRequestOrderId,
      "orderId": orderId,
      "deliveryId": deliveryWorkerId,
      "orderDeliveryType": orderDeliveryType,
    });

    return result.fold((l) => l, (r) => r);
  }
}
