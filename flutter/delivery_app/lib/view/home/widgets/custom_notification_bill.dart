import 'package:flutter/material.dart';

class CustomNotificationBill extends StatelessWidget {
  const CustomNotificationBill({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 61,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.notifications_active_outlined, size: 30),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
      ),
    );
  }
}
