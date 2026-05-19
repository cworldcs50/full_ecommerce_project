import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/services.dart';

class DeliveryModel extends Equatable {
  DeliveryModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  }) {
    toSharedPrefs();
  }

  final int id;
  final String email;
  final String phone;
  final String username;
  final String password;

  factory DeliveryModel.fromJson(Map<String, dynamic> jsonData) =>
      DeliveryModel(
        id: jsonData["delivery_id"],
        phone: jsonData["delivery_phone"],
        email: jsonData["delivery_email"],
        username: jsonData["delivery_name"],
        password: jsonData["delivery_password"],
      );

  Future<void> toSharedPrefs() async {
    SharedPreferences sharedPrefs = Get.find<Services>().prefs;

    await sharedPrefs.setInt("delivery_id", id);
    await sharedPrefs.setString("delivery_name", username);
    await sharedPrefs.setString("delivery_email", email);
    await sharedPrefs.setString("delivery_password", password);
    await sharedPrefs.setString("delivery_phone", phone);
  }

  @override
  String toString() => "$username\t$email\n$password\t$phone\n$id";

  @override
  List<Object?> get props => [id, username, email, password, phone];
}
