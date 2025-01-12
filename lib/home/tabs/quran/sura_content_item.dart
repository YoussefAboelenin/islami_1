import 'package:flutter/material.dart';
import 'package:islami_1/utils/app_colors.dart';

import '../../../utils/app_styles.dart';

class SuraContentItem extends StatelessWidget {
  String content;

  int index;

  SuraContentItem({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primarydark,
          width: 2,
        ),
      ),
      child: Text(
        '$content [${index + 1}]',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20primary,
      ),
    );
  }
}
