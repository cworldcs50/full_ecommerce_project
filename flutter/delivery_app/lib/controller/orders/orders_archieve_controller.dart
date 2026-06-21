import 'package:get/get.dart';

import '../../core/constants/enums/request_status.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/orders/orders_archieve_data.dart';
import '../../data/models/order_model.dart';

class OrdersArchieveController extends GetxController {
  RequestStatus? requestStatus;
  late List<OrderModel> completedOrders;
  late final OrdersArchieveData _ordersArchieveData;

  @override
  void onInit() async {
    super.onInit();
    await initData();
    await getCompletedOrders();
  }

  Future<void> initData() async {
    _ordersArchieveData = OrdersArchieveData(api: Get.find<Services>().api);
    completedOrders = [];
  }

  Future<void> getCompletedOrders() async {
    requestStatus = RequestStatus.loading;
    update();
    final response = await _ordersArchieveData.getCompletedOrders(
      Get.find<Services>().prefs.getInt("delivery_id")!.toString(),
    );

    final result = handlingData(response);

    update();

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        completedOrders =
            (response["data"] as List)
                .map((order) => OrderModel.fromJson(order))
                .toList();

        requestStatus = null;
      } else {
        completedOrders = [];
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
}
