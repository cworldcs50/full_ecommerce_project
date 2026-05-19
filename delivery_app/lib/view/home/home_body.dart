import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/home/pending_orders_controller.dart';
import '../orders/widgets/custom_order_card.dart';
import '../../core/class/request_handler_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PendingOrdersController>(
      builder: (controller) {
        return RequestHandlerView(
          status: controller.requestStatus,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.separated(
              itemCount: controller.orders.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder:
                  (context, index) => CustomOrderCard(
                    orderModel: controller.orders[index],
                    approveOrder:
                        () async => await controller.approveOrder(
                          controller.orders[index],
                        ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
