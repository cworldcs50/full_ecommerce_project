import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import '../../controller/orders/orders_assigned_to_delivery_controller.dart';
import 'widgets/custom_orders_list_view.dart';

class OrdersAssignedToDelivery extends StatelessWidget {
  const OrdersAssignedToDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<OrdersAssignedToDeliveryController>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: CustomOrdersListView(
              orders: controller.orders,
              doneOrder: controller.doneOrder,
              openReview: controller.openReview,
            ),
          );
        },
      ),
    );
  }
}
