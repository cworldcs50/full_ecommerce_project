import 'app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final arabicTheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 20,
        color: AppColor.black,
        height: 2,
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        fontSize: 23,
        color: AppColor.black,
        height: 2,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final englishTheme = ThemeData(
    fontFamily: "PlayfairDisplay",
    // appBarTheme: const AppBarTheme(
    //   centerTitle: true,
    //   iconTheme: IconThemeData(color: AppColor.primaryColorDark),
    //   titleTextStyle: TextStyle(
    //     fontSize: 25,
    //     fontWeight: FontWeight.bold,
    //     color: AppColor.primaryColorDark,
    //   ),
    // ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 20,
        color: AppColor.black,
        height: 2,
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        fontSize: 23,
        color: AppColor.black,
        height: 2,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
