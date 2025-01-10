import 'package:flutter/material.dart';
import 'package:islami_1/app_colors.dart';

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
        style: TextStyle(
          fontSize: 18,
          color: AppColors.primarydark,
        ),
      ),
    );
  }
}
