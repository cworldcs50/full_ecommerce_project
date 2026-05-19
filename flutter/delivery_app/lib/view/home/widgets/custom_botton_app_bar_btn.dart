import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomBottomAppBarBtn extends StatelessWidget {
  const CustomBottomAppBarBtn({
    super.key,
    required this.icon,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding:
              active ? const EdgeInsets.only(bottom: 20.0) : EdgeInsets.zero,
          child: Icon(
            size: active ? 40 : 30,
            icon,
            color:
                active
                    ? AppColor.primaryColorDark
                    : AppColor.bottomAppBarIconsColor,
          ),
        ),
      ),
    );
  }
}
