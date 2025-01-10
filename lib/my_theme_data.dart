import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColors.primarydark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primarydark),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
      ));
}
