import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  await Get.defaultDialog(
    title: "62".tr,
    middleText: "63".tr,
    actions: [
      ElevatedButton(onPressed: () => exit(0), child: Text("60".tr)),
      ElevatedButton(onPressed: () => Get.back(), child: Text("61".tr)),
    ],
  );

  return Future.value(true);
}
