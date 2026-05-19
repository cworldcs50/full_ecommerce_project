import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class ItemsCategories extends StatelessWidget {
  const ItemsCategories({
    super.key,
    required this.onTap,
    required this.trueIndex,
    required this.categoryName,
    required this.currentIndex,
  });

  final String categoryName;
  final void Function() onTap;
  final int trueIndex, currentIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            trueIndex == currentIndex
                ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: AppColor.primaryColorDark,
                    ),
                  ),
                )
                : null,
        child: Text(
          categoryName,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
