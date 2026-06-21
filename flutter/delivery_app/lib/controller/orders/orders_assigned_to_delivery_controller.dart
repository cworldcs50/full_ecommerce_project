import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/services/services.dart';
import '../../data/datasource/orders/orders_done_data.dart';
import '../../data/models/order_model.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/orders/orders_accepted_from_delivery_data.dart';

class OrdersAssignedToDeliveryController extends GetxController {
  late bool openReview;
  late List<OrderModel> orders;
  RequestStatus? requestStatus;
  late final Services _services;
  late final OrdersDoneData _ordersDoneData;
  late final TextEditingController noteController;
  late final OrdersAcceptedFromDeliveryData _ordersAcceptedFromDeliveryData;

  @override
  Future<void> onInit() async {
    super.onInit();
    initData();
    await getInWayOrders();
  }

  void initData() {
    orders = [];
    openReview = true;
    _services = Get.find<Services>();
    _ordersAcceptedFromDeliveryData = OrdersAcceptedFromDeliveryData(
      api: _services.api,
    );
    noteController = TextEditingController();
    _ordersDoneData = OrdersDoneData(crud: _services.api);
  }

  Future<void> getInWayOrders() async {
    requestStatus = RequestStatus.loading;
    update();
    final response = await _ordersAcceptedFromDeliveryData.getOrders(
      _services.prefs.getInt("delivery_id")!.toString(),
    );

    final result = handlingData(response);

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        orders =
            (response["data"] as List)
                .map((order) => OrderModel.fromJson(order))
                .toList();

        requestStatus = null;
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

  Future<void> doneOrder(OrderModel orderModel) async {
    requestStatus = RequestStatus.loading;
    update();
    final response = await _ordersDoneData.doneOrder(
      _services.prefs.getInt("delivery_id")!.toString(),
      "${orderModel.ordersId}",
      "${orderModel.ordersUserId}",
    );

    final result = handlingData(response);

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        await getInWayOrders();

        requestStatus = null;
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
}
