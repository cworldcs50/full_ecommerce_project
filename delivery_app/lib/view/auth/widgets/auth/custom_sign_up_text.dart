import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';

class CustomSignUpOrSignInText extends StatelessWidget {
  const CustomSignUpOrSignInText({
    super.key,
    required this.text,
    required this.onTap,
    required this.btnName,
  });

  final void Function() onTap;
  final String btnName, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, textAlign: TextAlign.center),
        InkWell(
          onTap: onTap,
          child: Text(
            btnName,
            style: const TextStyle(
              color: AppColor.primaryColorDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
