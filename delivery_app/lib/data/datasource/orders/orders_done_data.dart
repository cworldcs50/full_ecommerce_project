import '../../../core/class/api.dart';
import '../../../core/constants/app_api_links.dart';

class OrdersDoneData {
  const OrdersDoneData({required this.crud});

  final Api crud;

  Future<dynamic> doneOrder(
    String deliveryWorkerId,
    String orderId,
    String userId,
  ) async {
    final result = await crud.post(AppApiLinks.kDeliveryOrdersDone, {
      "orderId": orderId,
      "userId": userId,
      "deliveryWorkerId": deliveryWorkerId,
    });

    return result.fold((l) => l, (r) => r);
  }
}
