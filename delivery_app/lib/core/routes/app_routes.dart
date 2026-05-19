import 'package:get/get.dart';
import '../../view/home/home.dart';
import '../../view/auth/sign_in.dart';
import 'package:flutter/cupertino.dart';
import '../../view/orders/orders_archieve.dart';
import '../../view/orders/orders_details.dart';
import '../../view/settings/settings.dart';
import '../constants/app_routes_names.dart';
import 'middlewares/sign_in_middleware.dart';

final List<GetPage<Widget>> appPages = [
  // GetPage<VerifyCodeSignUp>(
  //   name: AppRoutesNames.kVerifyCodeSignUp,
  //   page: () => const VerifyCodeSignUp(),
  // ),
  // GetPage<SuccessCheckEmail>(
  //   name: AppRoutesNames.kSuccessCheckEmail,
  //   page: () => const SuccessCheckEmail(),
  // ),
  // GetPage<CheckEmail>(
  //   name: AppRoutesNames.kCheckEmail,
  //   page: () => const CheckEmail(),
  // ),
  // GetPage<SuccessResetPassword>(
  //   name: AppRoutesNames.kSuccessResetPassword,
  //   page: () => const SuccessResetPassword(),
  // ),
  // GetPage<Language>(
  //   name: AppRoutesNames.kLanguage,
  //   page: () => const Language(),
  //   middlewares: [LanguageMiddleware()],
  // ),
  GetPage<SignIn>(
    page: () => const SignIn(),
    name: AppRoutesNames.kLogin,
    middlewares: [SignInMiddleware()],
  ),
  GetPage(name: AppRoutesNames.kHome, page: () => const Home()),
  GetPage(name: AppRoutesNames.kSettings, page: () => const Settings()),
  GetPage(
    name: AppRoutesNames.kOrdersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRoutesNames.kOrdersArchieve,
    page: () => const OrdersArchieve(),
  ),

  // GetPage<ForgetPassword>(
  //   name: AppRoutesNames.kForgetPassword,
  //   page: () => const ForgetPassword(),
  // ),
  // GetPage<ForgetPasswordVerifyCode>(
  //   name: AppRoutesNames.kForgetPasswordVerifyCode,
  //   page: () => const ForgetPasswordVerifyCode(),
  // ),
  // GetPage<ResetPassword>(
  //   name: AppRoutesNames.kResetPassword,
  //   page: () => const ResetPassword(),
  // ),
];
