class AppApiLinks {
  static const String kBaseUrl = "http://10.0.2.2/ecommerce_backend/delivery";
  static const String kBaseImageUrl = "$kBaseUrl/upload";

  static const String kDeliverySignIn = "$kBaseUrl/auth/sign_in.php";

  static const String kDeliveryCheckMail =
      "$kBaseUrl/forget_password/check_email.php";

  static const String kDeliveryForgetPasswordVerificationCode =
      "$kBaseUrl/forget_password/forget_password_verification_code.php";

  static const String kDeliveryResetPassword =
      "$kBaseUrl/forget_password/reset_password.php";

  static const String kDeliveryOrdersArchieve =
      "$kBaseUrl/orders/orders_archieve.php";

  static const String kDeliveryOrdersApprove = "$kBaseUrl/orders/approve.php";

  static const String kDeliveryOrdersDone = "$kBaseUrl/orders/done.php";

  static const String kDeliveryOrdersView = "$kBaseUrl/orders/orders_view.php";

  static const String kDeliveryAssignedToDeliveryView =
      "$kBaseUrl/orders/orders_assigned_to_delivery.php";

  static const String kDeliveryOrderDetailsView =
      "$kBaseUrl/orders/orders_details.php";

  static const String kItemsImages = "$kBaseImageUrl/items";

}
