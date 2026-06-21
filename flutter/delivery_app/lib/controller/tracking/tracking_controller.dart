import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../core/functions/decode_polyline.dart';
import '../../data/datasource/orders/orders_done_data.dart';
import '../../data/models/order_model.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/constants/enums/request_status.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  late final Timer timer;
  List<Marker> markers = [];
  RequestStatus? requestStatus;
  late final Services _services;
  Set<Polyline> polylineSet = {};
  late final OrderModel orderModel;
  late double currentLat, currentLong;
  late final CameraPosition cameraPosition;
  late final OrdersDoneData _ordersDoneData;
  late final Completer<GoogleMapController> googleMapcontroller;
  late final StreamSubscription<Position> positionStreamSubscription;

  Future<void> initPolyline() async {
    polylineSet = await decodePolyline(
      currentLat,
      currentLong,
      orderModel.addressLat,
      orderModel.addressLong,
    );
  }

  void initData() {
    _ordersDoneData = OrdersDoneData(crud: _services.api);
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
        markerId: MarkerId("destination"),
        position: LatLng(orderModel.addressLat, orderModel.addressLong),
      ),
    );
  }

  Future<void> doneDelivery() async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await _ordersDoneData.doneOrder(
      "${orderModel.deliveryWorkerId}",
      "${orderModel.ordersId}",
      "${orderModel.ordersUserId}",
    );

    final result = handlingData(response);

    update();

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        requestStatus = null;
        await Get.offAllNamed(AppRoutesNames.kHome);
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

  void getCurrentLocation() {
    positionStreamSubscription = Geolocator.getPositionStream().listen((
      position,
    ) async {
      log(position.toString());
      currentLat = position.latitude;
      currentLong = position.longitude;
      await refreshLocation();
      await googleMapcontroller.future.then((googleMapController) {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(cameraPosition),
        );
      });

      markers.removeLast();
      markers.add(
        Marker(
          markerId: MarkerId("current"),
          position: LatLng(currentLat, currentLong),
        ),
      );
      update();
    });
  }

  Future<void> refreshLocation() async {
    await Future.delayed(Duration(seconds: 2));
    timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      await FirebaseFirestore.instance
          .collection("delivery")
          .doc("${orderModel.ordersId}")
          .set({
            "lat": currentLat,
            "long": currentLong,
            "deliveryId": _services.prefs.getString("delivery_id"),
          });
    });
  }

  @override
  void onInit() async {
    await initPolyline();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionStreamSubscription.cancel();
    timer.cancel();
    googleMapcontroller.future.then((value) => value.dispose());
    super.onClose();
  }
}
