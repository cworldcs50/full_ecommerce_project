import 'package:get/get.dart';
import 'validate_password.dart';
import '../constants/enums/input_type.dart';

String? validateInput(String val, int min, int max, InputType inputType) {
  if (inputType == InputType.email) {
    if (!GetUtils.isEmail(val)) {
      return "48";
    }
  } else if (inputType == InputType.username) {
    if (!GetUtils.isUsername(val)) {
      return "49";
    }
  } else if (inputType == InputType.password) {
    return validatePassword(val);
  } else if (inputType == InputType.phoneNumber) {
    if (!GetUtils.isPhoneNumber(val)) {
      return "50";
    }
  }

  if (val.length < min) {
    return "56";
  }

  if (val.length > max) {
    return "57";
  }

  return null;
}
