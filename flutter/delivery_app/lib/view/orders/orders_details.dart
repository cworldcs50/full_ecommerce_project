import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import '../../../core/functions/translate_data_base.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/orders/orders_details_controller.dart';
import '../../core/constants/app_routes_names.dart';
import '../auth/widgets/auth/custom_auth_button.dart';

class OrdersDetails extends GetView<OrdersDetailsController> {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColor.primaryColorDark,
        title: const Text(
          "Orders Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColorDark,
          ),
        ),
      ),
      body: GetBuilder<OrdersDetailsController>(
        builder:
            (controller) => RequestHandlerView(
              status: controller.requestStatus,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                children: [
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Table(
                          children: [
                            const TableRow(
                              children: [
                                Text(
                                  "item",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColorDark,
                                  ),
                                ),
                                Text(
                                  "QTY",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColorDark,
                                  ),
                                ),
                                Text(
                                  "price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColorDark,
                                  ),
                                ),
                              ],
                            ),
                            ...controller.items.map<TableRow>(
                              (item) => TableRow(
                                children: [
                                  Text(
                                    translateDataBase(
                                      item.itemsName,
                                      item.itemsNameAr,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${item.noItem}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${item.itemsPrice}\$",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Price: ${controller.orderModel.ordersPrice}\$",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColorDark,
                          ),
                        ),
                        if (controller.orderModel.ordersDeliveryType != 1)
                          const SizedBox(height: 20),
                        if (controller.orderModel.ordersDeliveryType != 1)
                          Text(
                            "Shipping: ${controller.orderModel.ordersDeliveryPrice}\$",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColorDark,
                            ),
                          ),
                        if (controller.orderModel.ordersDeliveryType != 1)
                          const SizedBox(height: 20),
                        Text(
                          "Total Price: ${controller.orderModel.ordersPrice + controller.orderModel.ordersDeliveryPrice}\$",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColorDark,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (controller.orderModel.ordersDeliveryType != 1)
                    Card(
                      child: ListTile(
                        title: const Text("Shipping Adress"),
                        titleTextStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColorDark,
                        ),
                        subtitleTextStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColorDark,
                        ),
                        subtitle: Text(
                          "${controller.orderModel.addressStreet}, ${controller.orderModel.addressCity}",
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (controller.orderModel.ordersDeliveryType != 1)
                    SizedBox(
                      height: 350,
                      width: Get.width,
                      child: Card(
                        child: GoogleMap(
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition,
                          onMapCreated:
                              (GoogleMapController ctrl) =>
                                  controller.googleMapcontroller.complete(ctrl),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (controller.orderModel.ordersDeliveryType != 1)
                    CustomAuthButton(
                      text: "Track Order",
                      onPressed:
                          () async => await Get.toNamed(
                            AppRoutesNames.kOrdersTracking,
                            arguments: {"order": controller.orderModel},
                          ),
                    ),
                ],
              ),
            ),
      ),
    );
  }
}
