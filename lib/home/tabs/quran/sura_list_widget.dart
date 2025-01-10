import 'package:flutter/material.dart';
import 'package:islami_1/app_colors.dart';

class SuraListWidget extends StatelessWidget {
  int index;

  String suraEnName;
  String suraArName;
  String ayaNumber;

  SuraListWidget(
      {required this.index,
      required this.suraEnName,
      required this.suraArName,
      required this.ayaNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_image.png'),
            Text(
              '$index',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraEnName,
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                  Text(
                    '$ayaNumber Verses',
                    style: TextStyle(color: AppColors.whiteColor),
                  )
                ],
              ),
              Text(
                suraArName,
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
