import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../data/models/order_model.dart';

class CustomOrderCard extends StatelessWidget {
  const CustomOrderCard({
    super.key,
    required this.orderModel,
    this.approveOrder,
    this.doneOrder,
  });

  final OrderModel orderModel;
  final void Function()? approveOrder, doneOrder;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Order Number: ${orderModel.ordersId}"),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(color: orderModel.getStatusColor()),
                  child: Text(
                    orderModel.getStatusString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                if (orderModel.ordersStatus == 0) const Spacer(),
              ],
            ),
            const Divider(thickness: 3),
            Text(
              "Order Type : ${orderModel.ordersDeliveryType == 0 ? "Delivery" : "Drive Thru"}",
            ),
            Text("Order Price : ${orderModel.ordersPrice}\$"),
            Text("Delivery Price: ${orderModel.ordersDeliveryPrice}\$"),
            Text(
              "Payment Method : ${orderModel.ordersPaymentMethod == "0" ? "Cash" : "Payment Cards"}",
            ),
            Text(
              "Order Rating: ${orderModel.ordersRating == 0 ? "Not rated yet" : orderModel.ordersRating}",
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                Jiffy.parse(orderModel.ordersCreationTime.toString()).fromNow(),
                style: const TextStyle(color: AppColor.primaryColorDark),
              ),
            ),
            const Divider(thickness: 3),
            Row(
              children: [
                Text(
                  "Total Price: ${orderModel.ordersPrice}\$",
                  style: const TextStyle(
                    color: AppColor.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),
                if (approveOrder != null && orderModel.ordersStatus == 2)
                  ElevatedButton(
                    onPressed: approveOrder,
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.primaryColorDark,
                    ),
                    child: const Text("Approve"),
                  ),
                if (orderModel.ordersStatus == 3)
                  ElevatedButton(
                    onPressed: doneOrder,
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.primaryColorDark,
                    ),
                    child: const Text("done"),
                  ),

                const Spacer(),
                ElevatedButton(
                  onPressed:
                      () async => await Get.toNamed(
                        AppRoutesNames.kOrdersDetails,
                        arguments: {"order": orderModel},
                      ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.primaryColorDark,
                  ),
                  child: const Text("Details"),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CustomRatingTextFormField extends StatelessWidget {
  const CustomRatingTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 1,
      decoration: InputDecoration(
        hintText: "Enter Rating from 1 to 5",
        suffixIcon: const Icon(Icons.star_rate_outlined),
        hintStyle: Theme.of(context).textTheme.bodySmall,
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Text("Rating"),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      ),
    );
  }
}

class CustomNoteTextFormField extends StatelessWidget {
  const CustomNoteTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 255,
      controller: controller,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 10,
      decoration: InputDecoration(
        hintText: "Enter note",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Text("note"),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      ),
    );
  }
}
