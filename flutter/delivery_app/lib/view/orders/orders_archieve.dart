import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';

import '../../controller/orders/orders_archieve_controller.dart';
import 'widgets/custom_orders_list_view.dart';

class OrdersArchieve extends StatelessWidget {
  const OrdersArchieve({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<OrdersArchieveController>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: CustomOrdersListView(
              orders: controller.completedOrders,
              openReview: false,
            ),
          );
        },
      ),
    );
  }
}
