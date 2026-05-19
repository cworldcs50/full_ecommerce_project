import 'view/delivery_app.dart';
import 'core/services/services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(DeliveryApp());
}
