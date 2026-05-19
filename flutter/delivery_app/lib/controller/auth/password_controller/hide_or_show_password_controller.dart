import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HideOrShowPasswordController extends GetxController {
  void hideOrShowPassword();
}

class HideOrShowPasswordControllerImp extends HideOrShowPasswordController {
  bool isObsecuredText = true;
  IconData passwordIcon = Icons.lock_clock_rounded;

  @override
  void hideOrShowPassword() {
    isObsecuredText = !isObsecuredText;
    passwordIcon =
        passwordIcon == Icons.lock_clock_outlined
            ? Icons.lock_clock_rounded
            : Icons.lock_clock_outlined;
    update();
  }
}
