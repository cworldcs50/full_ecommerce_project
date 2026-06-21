import 'dart:convert';
import '../constants/app_color.dart';
import '../constants/app_secrets.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

Future<Set<Polyline>> decodePolyline(
  double lat,
  double long,
  double destLat,
  double destLang,
) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineCoor = [];

  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destLat,$destLang&key=${AppSecrets.polylineApiKey}";

  http.Response response = await http.get(Uri.parse(url));

  dynamic responseBody = jsonDecode(response.body);

  dynamic point = responseBody["routes"][0]["overview_polyline"]["points"];

  List<PointLatLng> result = PolylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    for (PointLatLng pointLatLng in result) {
      polylineCoor.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    }
  }

  Polyline polyline = Polyline(
    width: 5,
    points: polylineCoor,
    color: AppColor.primaryColorDark,
    polylineId: PolylineId("delivery_app_polyline"),
  );

  polylineSet.add(polyline);

  return polylineSet;
}
