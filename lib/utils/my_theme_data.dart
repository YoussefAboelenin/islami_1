import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColors.primarydark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primarydark),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
        selectedLabelStyle: AppStyles.bold14White),
  );
}
