import 'dart:async';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/enums/request_status.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/datasource/orders/orders_details_data.dart';
import '../../data/models/items_details_model.dart';
import '../../data/models/order_model.dart';

class OrdersDetailsController extends GetxController {
  List<Marker> markers = [];
  RequestStatus? requestStatus;
  late final Services _services;
  late final OrderModel orderModel;
  late List<ItemsDetailsModel> items;
  late final CameraPosition cameraPosition;
  late final OrdersDetailsData _ordersDetailsData;
  late final Completer<GoogleMapController> googleMapcontroller;

  @override
  void onInit() async {
    super.onInit();
    initData();
    await getOrdersItemsDetails();
  }

  void initData() {
    items = [];
    orderModel = Get.arguments["order"];
    _services = Get.find<Services>();
    cameraPosition = CameraPosition(
      tilt: 59.440717697143555,
      zoom: 12,
      bearing: 192.8334901395799,
      target: LatLng(orderModel.addressLat, orderModel.addressLong),
    );
    googleMapcontroller = Completer<GoogleMapController>();
    markers.add(
      Marker(
        markerId: MarkerId("${orderModel.addressId}"),
        position: LatLng(orderModel.addressLat, orderModel.addressLong),
      ),
    );
    _ordersDetailsData = OrdersDetailsData(api: _services.api);
  }

  Future<void> getOrdersItemsDetails() async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await _ordersDetailsData.getOrdersDetails(
      "${orderModel.ordersId}",
    );
    final result = handlingData(response);

    if (RequestStatus.success == result) {
      if (response["status"] == "success") {
        items =
            (response["data"] as List)
                .map((item) => ItemsDetailsModel.fromJson(item))
                .toList();
        requestStatus = null;
      } else {
        requestStatus = RequestStatus.noData;
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
    }

    update();

    await Future.delayed(const Duration(seconds: 2), () {
      requestStatus = null;
      update();
    });
  }
}
