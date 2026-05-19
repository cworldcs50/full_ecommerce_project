import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int addressId;
  final int addressUserId;
  final String addressCity;
  final String addressStreet;
  final double addressLat;
  final double addressLong;
  final String name;

  final int ordersId;
  final DateTime ordersCreationTime;
  final int ordersAddressId;
  final int ordersUserId;
  final double ordersPrice;
  final int isOrdersApplyCoupon;
  final int ordersDeliveryType;
  final String ordersPaymentMethod;
  final double ordersDeliveryPrice;
  final int ordersStatus;
  final double ordersTotalPrice;
  final int ordersRating;
  final String? ordersNoteRating;
  final int deliveryWorkerId;

  const OrderModel({
    required this.addressId,
    required this.addressUserId,
    required this.addressCity,
    required this.addressStreet,
    required this.addressLat,
    required this.addressLong,
    required this.name,
    required this.ordersId,
    required this.ordersCreationTime,
    required this.ordersAddressId,
    required this.ordersUserId,
    required this.ordersPrice,
    required this.isOrdersApplyCoupon,
    required this.ordersDeliveryType,
    required this.ordersPaymentMethod,
    required this.ordersDeliveryPrice,
    required this.ordersStatus,
    required this.ordersTotalPrice,
    required this.ordersRating,
    this.ordersNoteRating,
    required this.deliveryWorkerId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      addressId: json['address_id'],
      addressUserId: json['address_userid'],
      addressCity: json['address_city'],
      addressStreet: json['address_street'],
      addressLat: (json['address_lat'] as num).toDouble(),
      addressLong: (json['address_long'] as num).toDouble(),
      name: json['name'],
      ordersId: json['orders_id'],
      ordersCreationTime: DateTime.parse(json['orders_creation_time']),
      ordersAddressId: json['orders_address_id'],
      ordersUserId: json['orders_user_id'],
      ordersPrice: (json['orders_price'] as num).toDouble(),
      isOrdersApplyCoupon: json['is_orders_apply_coupon'],
      ordersDeliveryType: json['orders_delivery_type'],
      ordersPaymentMethod: json['orders_payment_method'].toString(),
      ordersDeliveryPrice: (json['orders_delivery_price'] as num).toDouble(),
      ordersStatus: json['orders_status'],
      ordersTotalPrice: (json['orders_total_price'] as num).toDouble(),
      ordersRating: json['orders_rating'] ?? 0,
      ordersNoteRating: json['orders_note_rating'],
      deliveryWorkerId: json['delivery_worker_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_id': addressId,
      'address_userid': addressUserId,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_lat': addressLat,
      'address_long': addressLong,
      'name': name,
      'orders_id': ordersId,
      'orders_creation_time': ordersCreationTime.toString(),
      'orders_address_id': ordersAddressId,
      'orders_user_id': ordersUserId,
      'orders_price': ordersPrice,
      'is_orders_apply_coupon': isOrdersApplyCoupon,
      'orders_delivery_type': ordersDeliveryType,
      'orders_payment_method': ordersPaymentMethod,
      'orders_delivery_price': ordersDeliveryPrice,
      'orders_status': ordersStatus,
      'orders_total_price': ordersTotalPrice,
      'orders_rating': ordersRating,
      'orders_note_rating': ordersNoteRating,
      'delivery_worker_id': deliveryWorkerId,
    };
  }

  @override
  List<Object?> get props => [
    addressId,
    addressUserId,
    addressCity,
    addressStreet,
    addressLat,
    addressLong,
    name,
    ordersId,
    ordersCreationTime,
    ordersAddressId,
    ordersUserId,
    ordersPrice,
    isOrdersApplyCoupon,
    ordersDeliveryType,
    ordersPaymentMethod,
    ordersDeliveryPrice,
    ordersStatus,
    ordersTotalPrice,
    ordersRating,
    ordersNoteRating,
    deliveryWorkerId,
  ];

  /// Get status string based on orders status code
  /// 0 ==> pending
  /// 1 ==> approved from store
  /// 2 ==> order prepared
  /// 3 ==> assigned to delivery
  /// 4 ==> completed
  /// 5 ==> cancelled
  String getStatusString() {
    switch (ordersStatus) {
      case 0:
        return "pending";
      case 1:
        return "approved from store";
      case 2:
        return "order prepared";
      case 3:
        return "assigned to delivery";
      case 4:
        return "completed";
      case 5:
        return "cancelled";
      default:
        return "unknown";
    }
  }

  /// Get color based on orders status code
  /// 0 ==> pending (pink)
  /// 1 ==> approved from store (deep orange)
  /// 2 ==> order prepared (blue grey)
  /// 3 ==> assigned to delivery (amber)
  /// 4 ==> completed (green)
  /// 5 ==> cancelled (red)
  Color getStatusColor() {
    switch (ordersStatus) {
      case 0:
        return Colors.pink;
      case 1:
        return Colors.deepOrangeAccent;
      case 2:
        return Colors.blueGrey;
      case 3:
        return Colors.amber;
      case 4:
        return Colors.green;
      case 5:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
