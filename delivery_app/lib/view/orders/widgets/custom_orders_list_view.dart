import '../../../data/models/order_model.dart';
import 'package:flutter/material.dart';

import 'custom_order_card.dart';

class CustomOrdersListView extends StatelessWidget {
  const CustomOrdersListView({
    super.key,
    required this.orders,
    required this.openReview,
    this.approveOrder,
    this.doneOrder,
  });

  final bool openReview;
  final List<OrderModel> orders;
  final void Function()? approveOrder;
  final Future<void> Function(OrderModel orderModel)? doneOrder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemBuilder:
          (context, index) => CustomOrderCard(
            doneOrder: () async {
              if (doneOrder != null) {
                await doneOrder!(orders[index]);
              }
            },
            orderModel: orders[index],
            approveOrder: approveOrder,
          ),
    );
  }
}
