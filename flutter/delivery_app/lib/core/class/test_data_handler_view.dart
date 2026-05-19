import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_image_assets.dart';
import '../constants/enums/request_status.dart';

class TestDataHandlerView extends StatelessWidget {
  const TestDataHandlerView({
    required this.requestStatus,
    required this.widget,
    super.key,
  });

  final Widget widget;
  final RequestStatus requestStatus;

  @override
  Widget build(BuildContext context) {
    switch (requestStatus) {
      case RequestStatus.noData:
        return Lottie.asset(AppImageAssets.noData, fit: BoxFit.fill);
      case RequestStatus.loading:
        return Center(
          child: Lottie.asset(AppImageAssets.loading, fit: BoxFit.fill),
        );
      case RequestStatus.offlineFailure:
        return Center(
          child: Lottie.asset(AppImageAssets.offline, fit: BoxFit.fill),
        );
      case RequestStatus.success:
        return widget;

      case RequestStatus.serverFailure:
        return Center(
          child: Lottie.asset(AppImageAssets.serverFailure, fit: BoxFit.fill),
        );
      case RequestStatus.failure:
        return Center(
          child: Lottie.asset(AppImageAssets.noData, fit: BoxFit.fill),
        );
    }
  }
}
