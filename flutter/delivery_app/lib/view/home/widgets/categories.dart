import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categoryImage,
    required this.categoryName,
    required this.onTap,
  });

  final String categoryName, categoryImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              color: AppColor.primaryColorDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              width: 50,
              height: 50,
              imageUrl: categoryImage,
              errorWidget:
                  (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                    color: AppColor.primaryColorLight,
                  ),
              placeholder:
                  (context, url) => ShaderMask(
                    shaderCallback:
                        (bounds) => LinearGradient(
                          colors: [
                            Colors.grey[300]!,
                            Colors.grey[100]!,
                            Colors.grey[300]!,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ).createShader(bounds),
                    child: Container(
                      width: 90,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
            ),
          ),
        ),

        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
