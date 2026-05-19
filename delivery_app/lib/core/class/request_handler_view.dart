import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../constants/app_image_assets.dart';
import '../constants/enums/request_status.dart';

class RequestHandlerView extends StatelessWidget {
  const RequestHandlerView({
    super.key,
    required this.child,
    required this.status,
  });

  final Widget child;
  final RequestStatus? status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RequestStatus.noData:
        return Center(child: Lottie.asset(AppImageAssets.noData));
      case RequestStatus.loading:
        return Center(child: Lottie.asset(AppImageAssets.loading));
      case RequestStatus.failure:
        return Center(child: Lottie.asset(AppImageAssets.failure));
      case RequestStatus.serverFailure:
        return Center(child: Lottie.asset(AppImageAssets.serverFailure));
      case RequestStatus.offlineFailure:
        return Center(child: Lottie.asset(AppImageAssets.offline));
      default:
        return child;
    }
  }
}
