import 'package:flutter/material.dart';
import 'custom_notification_bill.dart';
import 'custom_search_form_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.controller,
    required this.onPressedIcon,
    required this.onChanged,
    required this.onPressedSearch,
    required this.onFieldSubmitted,
  });

  final String title;
  final void Function() onPressedIcon;
  final void Function(String) onChanged;
  final void Function() onPressedSearch;
  final TextEditingController controller;
  final void Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: CustomSearchFormField(
              onFieldSubmitted: onFieldSubmitted,
              title: title,
              onChanged: onChanged,
              controller: controller,
              onPressedSearch: onPressedSearch,
            ),
          ),
          CustomNotificationBill(onPressed: onPressedIcon),
        ],
      ),
    );
  }
}
