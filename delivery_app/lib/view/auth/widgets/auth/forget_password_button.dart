import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "18".tr,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.end,
      ),
    );
  }
}
