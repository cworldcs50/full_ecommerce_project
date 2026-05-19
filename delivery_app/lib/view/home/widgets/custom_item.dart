import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/constants/app_color.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    required this.imagePath,
    required this.onTap,
    required this.title,
    super.key,
  });

  final String imagePath, title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              width: 240,
              height: 160,
              imageUrl: imagePath,
              errorWidget:
                  (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColor.primaryColorLight,
                    size: 70,
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
          Container(
            height: 160,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          Positioned(
            top: 10,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
