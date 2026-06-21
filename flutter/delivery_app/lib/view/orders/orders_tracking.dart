import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import '../../controller/tracking/tracking_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColor.primaryColorDark,
        title: const Text(
          "Orders Tracking",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColorDark,
          ),
        ),
      ),
      body: GetBuilder<TrackingController>(
        builder:
            (controller) => RequestHandlerView(
              status: controller.requestStatus,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                children: [
                  if (controller.orderModel.ordersDeliveryType != 1)
                    Expanded(
                      child: GoogleMap(
                        polylines: controller.polylineSet,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.cameraPosition,
                        onMapCreated:
                            (GoogleMapController ctrl) =>
                                controller.googleMapcontroller.complete(ctrl),
                      ),
                    ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: AppColor.primaryColorDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () async => await controller.doneDelivery(),
                    child: const Text("The Order has been delivered"),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
