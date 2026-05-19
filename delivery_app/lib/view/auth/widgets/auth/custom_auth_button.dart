import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';


class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    required this.onPressed,
    required this.text,
    super.key,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: AppColor.primaryColorDark,
      padding: const EdgeInsets.symmetric(vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(text),
    );
  }
}
