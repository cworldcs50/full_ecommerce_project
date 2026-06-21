import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/orders/orders_pending_data.dart';
import '../../data/models/order_model.dart';
import '../../core/constants/enums/request_status.dart';
import '../tracking/tracking_controller.dart';

class PendingOrdersController extends GetxController {
  RequestStatus? requestStatus;
  List<OrderModel> orders = [];
  late final OrdersPendingData _ordersPendingData;

  @override
  Future<void> onInit() async {
    super.onInit();
    await initialData();
    await getOrders();
  }

  Future<void> initialData() async {
    _ordersPendingData = OrdersPendingData(crud: Get.find<Services>().api);
  }

  Future<void> getOrders() async {
    requestStatus = RequestStatus.loading;
    update();
    final response = await _ordersPendingData.getData();

    final result = handlingData(response);

    update();

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        orders =
            (response["data"] as List)
                .map((order) => OrderModel.fromJson(order))
                .toList();

        requestStatus = null;
      } else {
        orders = [];
        requestStatus = RequestStatus.noData;
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
    }

    update();
    if (requestStatus != null) {
      await Future.delayed(const Duration(seconds: 2), () {
        requestStatus = null;
        update();
      });
    }
  }

  Future<void> approveOrder(OrderModel orderModel) async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await _ordersPendingData.approveOrder(
      deliveryWorkerId:
          Get.find<Services>().prefs.getInt("delivery_id")!.toString(),
      userRequestOrderId: "${orderModel.ordersUserId}",
      orderDeliveryType: "${orderModel.ordersDeliveryType}",
      orderId: "${orderModel.ordersId}",
    );

    final result = handlingData(response);

    update();

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        requestStatus = null;
        TrackingController _ = Get.put<TrackingController>(
          TrackingController(),
        );
      } else {
        requestStatus = RequestStatus.noData;
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
    }

    update();
    if (requestStatus != null) {
      await Future.delayed(const Duration(seconds: 2), () {
        requestStatus = null;
        update();
      });
    }
  }

  void refreshDeliveryHomePage() => getOrders();
}
